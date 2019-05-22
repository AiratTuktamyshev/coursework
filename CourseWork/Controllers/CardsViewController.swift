//
//  CardsViewController.swift
//  CourseWork
//
//  Created by Айрат Туктамышев on 16/05/2019.
//  Copyright © 2019 Айрат Туктамышев. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    
    
    @IBOutlet weak var TableView: UITableView!
    
    var request = URLRequest(url: clashURL)
    
    
    var mycards:[ClashCards]=[]//для основного парсинга
    var currentmycard:[ClashCards]=[]// Для поиска
    
    var items: ItemsResponse?///для первичного парсинга
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCardJSON()
        
    }
    
    func loadCardJSON(){
        //Распарсиваем json
        //var json:ItemsResponse!
        request.httpMethod="GET"
        request.httpBody=Data()
        request.addValue("contentType", forHTTPHeaderField: "Application/JSON")
        request.setValue( "Bearer \(mykey)",forHTTPHeaderField:"Authorization")
        
        let clashTask=URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error==nil {
                do {
                    let json=try JSONDecoder().decode(ItemsResponse.self, from: data!)
                    self.mycards=json.items//ЭТО ГЕНИАЛЬНО
                    
                    
                    print(self.mycards)
                    
                    DispatchQueue.main.async {
                        self.TableView.reloadData()
                    }
                    
                    
                }
                catch let error {print(error)}
            }
        }
        clashTask.resume()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return mycards.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell" )as? CardCell else {return UITableViewCell() }
        cell.levelLabel.text = "Max level:" + String(mycards[indexPath.row].maxLevel)
        cell.nameLabel.text="Name: "+mycards[indexPath.row].name

        if let imageUrl=URL(string: mycards[indexPath.row].iconUrls.medium){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageUrl)
                if let data=data{
                    let image=UIImage(data:data)
                    DispatchQueue.main.async {
                        cell.imageCard.image=image
                    }
                }
            }
        }
        return cell

    }
    
    
   
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


class   CardCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    // Do any additional setup after loading the view.
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var imageCard: UIImageView!
}

