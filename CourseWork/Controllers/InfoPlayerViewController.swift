//
//  InfoPlayerViewController.swift
//  CourseWork
//
//  Created by Айрат Туктамышев on 19/05/2019.
//  Copyright © 2019 Айрат Туктамышев. All rights reserved.
//

import UIKit

class InfoPlayerViewController: UIViewController {
    
    
    var myPlayer:PlayerS?

    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tagLabel.text="Тэг:"+String(myPlayer!.tag)
        nameLabel.text="Имя:"+String(myPlayer!.name)
        // Do any additional setup after loading the view.
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="MyCardSeg"
        {
            if let dest=segue.destination as? MyCardViewController{
                dest.mycards = self.myPlayer!.cards! 
            }
        }
        if segue.identifier=="AchievSeg"
        {
            if let dest=segue.destination as? AchievmentViewController{
                dest.myAchiev=self.myPlayer!.achievements!
            }
        }
    
        
        
    }
    
}


 
