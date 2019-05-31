//
//  PlayersViewController.swift
//  CourseWork
//
//  Created by Айрат Туктамышев on 17/05/2019.
//  Copyright © 2019 Айрат Туктамышев. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {
   
    let playerURL:String="https://api.clashroyale.com/v1/players/%23YYRU08PR"
    var infoPlayer:PlayerS?
    
    @IBOutlet weak var ActivityIND: UIActivityIndicatorView!
    @IBOutlet weak var SegButton: UIButton!
    @IBOutlet weak var testlabel: UILabel!
    @IBOutlet weak var OKbut: UIButton!
    @IBOutlet weak var EnterTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("zco")
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
                    
                    playerloadjson(req:playerRequest)
                    
                }
    }
    



    
  
    
    private func Hid()
    {
        
        if infoPlayer != nil{
            testlabel.text="Ваше имя: \(String(describing: self.infoPlayer!.name))"
            SegButton.isHidden=false
        }
        
        if infoPlayer == nil{
            SegButton.isHidden=true
        }
        
        
    }
    
    
    
    func playerloadjson( req:URLRequest) {
        //Распарсиваем json
        //var json:ItemsResponse!
        var myrequest=req
        myrequest.httpMethod="GET"
        myrequest.httpBody=Data()
        myrequest.addValue("contentType", forHTTPHeaderField: "Application/JSON")
        myrequest.setValue( "Bearer \(mykey)",forHTTPHeaderField:"Authorization")
        
        
        let clashTask=URLSession.shared.dataTask(with: myrequest) { [weak self](data, response, error) in
            guard let self = self else {return}
            if error==nil {
                do {
                    DispatchQueue.main.async {
                        self.ActivityIND.startAnimating()

                    }
                     let json=try JSONDecoder().decode(PlayerS.self, from: data!)
                    self.infoPlayer=json
                    print(self.infoPlayer as Any)
                    DispatchQueue.main.async {
                        self.ActivityIND.startAnimating()
                        self.Hid()
                        
                    }
                }
                catch let error {
                        print(error)
                    DispatchQueue.main.async {
                        self.ActivityIND.stopAnimating()
                        
                    }
                }
            }
            else {
                DispatchQueue.main.async {
                    self.ActivityIND.stopAnimating()
                    
                }
                
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


