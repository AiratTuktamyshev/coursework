//
//  CardsViewController.swift
//  CourseWork
//
//  Created by Айрат Туктамышев on 16/05/2019.
//  Copyright © 2019 Айрат Туктамышев. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift

class CardsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    
    
    @IBOutlet weak var TableView: UITableView!
    
    var request = URLRequest(url: (URL(string:"https://api.clashroyale.com/v1/cards/"))!)

    var mycards:[ClashCards]=[]//для основного парсинга
    
    var itemsd:ItemsResponse = ItemsResponse(items:[])
    
    let realm = try! Realm()
    var ritems:Results<CardsRealm>!//Контейнер со свойствами
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       ritems=realm.objects(CardsRealm.self)
        //print(Realm.Configuration.defaultConfiguration.fileURL)
       LoadCardJSON()
        
    }
            

        

    func LoadRealm()
    {

        // тут я решил очень интересную проблему
        var tempArray : [CardsRealm ] = []
        
            for s in mycards{
            let temp = CardsRealm()
            temp.name=s.name
            temp.iconUrls=s.iconUrls.medium
            temp.maxLevel=s.maxLevel
            tempArray.append(temp)
        }
        
        
        try! realm.write {
            realm.add(tempArray,update: .modified)
        }
        
    }
    
    
    
    func LoadCardJSON(){
        //Распарсиваем json
        //var json:ItemsResponse!
        request.httpMethod="GET"
        request.httpBody=Data()
        request.addValue("contentType", forHTTPHeaderField: "Application/JSON")
        request.setValue( "Bearer \(constant.mykey)",forHTTPHeaderField:"Authorization")
        
        let clashTask=URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            guard let self = self else {return}
            if error==nil {
                do {
                    
                    let json=try JSONDecoder().decode(ItemsResponse.self, from: data!)
                    self.mycards=json.items
                    
                    print(self.mycards)
                    
                    DispatchQueue.main.async {//Насколько я понял,Реалм любит маин трейд
                        self.LoadRealm()
                        self.TableView.reloadData()
                    }
                    
                }
                catch let error {print(error)}
            }
        }
        clashTask.resume()
        
     }
    
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return ritems.count
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell" )as? CardCell else {return UITableViewCell() }
            
            cell.levelLabel.text = "Max level:"+String(ritems[indexPath.row].maxLevel)
            cell.nameLabel.text="Name: "+ritems[indexPath.row].name!
    
            if  let imageUrl=URL(string: ritems[indexPath.row].iconUrls!){
                cell.imageCard.kf.indicatorType = .activity
                cell.imageCard.kf.setImage(with:imageUrl, placeholder: nil, options: [.transition(.fade(0.7))],progressBlock: nil)
                }
            return cell
    
        }


    
}


class   CardCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    // Do any additional setup after loading the view.
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var imageCard: UIImageView!
}

