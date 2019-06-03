//
//  PlayersViewController.swift
//  CourseWork
//
//  Created by Айрат Туктамышев on 17/05/2019.
//  Copyright © 2019 Айрат Туктамышев. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {
    
    private let playerURL:String="https://api.clashroyale.com/v1/players/%23YYRU08PR"
    var infoPlayer:PlayerS?

    
    
    @IBOutlet weak var activityind: UIActivityIndicatorView!
    @IBOutlet weak var SegButton: UIButton!
    @IBOutlet weak var testlabel: UILabel!
    @IBOutlet weak var OKbut: UIButton!
    @IBOutlet weak var EnterTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first as UITouch?) != nil
        {
            view.endEditing(true)
        }
    }
    
    
    @IBAction func EnterButton(_ sender: UIButton) {
        if(sender.restorationIdentifier=="OKbutton")
                {
                    let myPlayerUrl=playerURL+"/"
                    let playerRequest = URLRequest(url: URL(string: myPlayerUrl)!)
                    view.endEditing(true)//закрываем клаву
                    activityind.startAnimating()
                    
                    playerloadjson(req:playerRequest)
                    
                }
    }
    



    
  
    
    func Hid()
    {
        DispatchQueue.main.async{ 
            
                if self.infoPlayer != nil{
                    self.testlabel.text="Ваше имя: \(String(describing: self.infoPlayer!.name))"
                    self.SegButton.isHidden=false
                    self.activityind.stopAnimating()
                }
                if self.infoPlayer == nil{
                    self.testlabel.text="Ошибка"
                    self.SegButton.isHidden=true
                    self.activityind.stopAnimating()
                }
            }
        }

    
    
    
    
    
     func playerloadjson( req:URLRequest) {
        //Распарсиваем json
        //var json:ItemsResponse!
        var myrequest=req
        myrequest.httpMethod="GET"
        myrequest.httpBody=Data()
        myrequest.addValue("contentType", forHTTPHeaderField: "Application/JSON")
        myrequest.setValue( "Bearer \(constant.mykey)",forHTTPHeaderField:"Authorization")
        
        let clashTask=URLSession.shared.dataTask(with: myrequest) { [weak self](data, response, error) in
            guard let self = self else {return}
            if error==nil {
                do {
                    
                    
                    let json=try JSONDecoder().decode(PlayerS.self, from: data!)
                    self.infoPlayer=json
                    print(self.infoPlayer as Any)
                    self.Hid()
                    

 
                }
                catch let error {
                        print(error)
                    self.Hid()

                    
                }
            }
            else {
                self.Hid()

            }
            
        }
        clashTask.resume()

    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="PlayerSeg"
        {
            if let dest=segue.destination as? InfoPlayerViewController{
                dest.myPlayer = self.infoPlayer
            }
        }
    }
    
    
}

