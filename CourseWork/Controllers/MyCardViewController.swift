//
//  MyCardViewController.swift
//  CourseWork
//
//  Created by Айрат Туктамышев on 20/05/2019.
//  Copyright © 2019 Айрат Туктамышев. All rights reserved.
//

import UIKit

class MyCardViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var MyTableView: UITableView!
    
    
    var mycards:[PlayerS.PlayerCards]=[]
    
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
         // Do any additional setup after loading the view.
        
        //print(mycards)
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mycards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCardCell" )as? MyTableCell else {return UITableViewCell() }
        
        
        cell.nameLabel.text="Название:"+String(mycards[indexPath.row].name)
        cell.levelLabel.text="Уровень:"+String(mycards[indexPath.row].level)
    
        cell.maxLabel.text="Макс.уровень:"+String(mycards[indexPath.row].maxLevel)
        
         cell.countLabel.text="Количество:"+String(mycards[indexPath.row].count)
        
        
        
        if let imageUrl=URL(string: mycards[indexPath.row].iconUrls.medium){
            cell.myCardIMG.kf.indicatorType = .activity
            cell.myCardIMG.kf.setImage(with:imageUrl, placeholder: nil, options: [.transition(.fade(0.7))],progressBlock: nil)
        }
//
//        if let imageUrl=URL(string: mycards[indexPath.row].iconUrls.medium){
//            DispatchQueue.global().async {
//                let data = try? Data(contentsOf: imageUrl)
//                if let data=data{
//                    let image=UIImage(data:data)
//                    DispatchQueue.main.async {
//                        print("Карты работают")
//                        //cell.myCardIMG.image=image
//                        cell.myCardIMG.image=image
//                    }
//                }
//            }
//        }
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




class  MyTableCell: UITableViewCell {
    @IBOutlet weak var myCardIMG: UIImageView!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
}
