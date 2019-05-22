//
//  AchievmentViewController.swift
//  CourseWork
//
//  Created by Айрат Туктамышев on 20/05/2019.
//  Copyright © 2019 Айрат Туктамышев. All rights reserved.
//

import UIKit

class AchievmentViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var myAchiev:[PlayerS.Achiv]=[]
    
    @IBOutlet weak var AchievTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myAchiev.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AchievCelliD" )as?
AchievCell else {return UITableViewCell() }
        
        print(myAchiev[indexPath.row].name)
        cell.nameLabel.text="Название:"+myAchiev[indexPath.row].name
        cell.starsLabel.text="Звезды:"+String(myAchiev[indexPath.row].stars)
        cell.infoLabel.text="Информация:"+myAchiev[indexPath.row].info
        
        
        return cell
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //print(myAchiev)
        // Do any additional setup after loading the view.
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



class AchievCell:UITableViewCell{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
}
