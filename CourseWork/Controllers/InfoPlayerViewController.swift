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
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var trophieLabel: UILabel!
    
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var loseLabel: UILabel!
    @IBOutlet weak var allbatleLabel: UILabel!
    
    @IBOutlet weak var donateLabel: UILabel!
    
    @IBOutlet weak var mycardLabel: UILabel!
    
    @IBOutlet weak var mycardlevelLabel: UILabel!
    
    
    @IBOutlet weak var mycardimage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelWrite()
        // Do any additional setup after loading the view.
     }
    
    
    
    
    func labelWrite()
    {
        tagLabel.text="Тэг:"+String(myPlayer!.tag)
        nameLabel.text="Имя:"+String(myPlayer!.name)
        levelLabel.text="Уровень:"+String(myPlayer!.expLevel)
        trophieLabel.text="Трофеи:"+String(myPlayer!.trophies)
        winsLabel.text="Победы:"+String(myPlayer!.wins)
        allbatleLabel.text="Сражений:"+String(myPlayer!.battleCount)
        loseLabel.text="Проигрыши :"+String(myPlayer!.losses)
        donateLabel.text="Донаты:"+String(myPlayer!.donations)
        
        mycardLabel.text="Имя:"+String(myPlayer!.currentFavouriteCard!.name)
        mycardlevelLabel.text="Уровень:"+String(myPlayer!.currentFavouriteCard!.maxLevel)
        
        
        downloadImage()
        
        
    }
    
    func downloadImage() {
        print("Download Started")
        
        guard let myurl=URL(string: myPlayer!.currentFavouriteCard!.iconUrls.medium)
            else {return}
        
        
        let task = URLSession.shared.dataTask(with: myurl) { data, response, error in
            guard let data = data, error == nil
                else {
                print("error")
                return }
            
        DispatchQueue.main.async() {    // execute on main thread
                self.mycardimage.image = UIImage(data: data)
            }
        }
        task.resume()
        
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


 
