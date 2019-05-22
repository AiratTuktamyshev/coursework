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
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//       if segue.identifier=="TestSeg"
//       {
//        if let dest = segue.destination as? TabBarViewController {
//            dest.infoPlayer = self.infoPlayer        }
//
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="PlayerSeg"
        {
            if let dest=segue.destination as? InfoPlayerViewController{
                dest.myPlayer = self.infoPlayer
            }
        }
        
    }
    
 
    
    @IBOutlet weak var SegButton: UIButton!
    @IBOutlet weak var testlabel: UILabel!
    @IBOutlet weak var EnterTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myPlayerUrl=playerURL+"/"
        let playerRequest = URLRequest(url: URL(string: myPlayerUrl)!)
        playerloadjson(req:playerRequest)        
        // Do any additional setup after loading the view.
    }
    
 
    @IBAction func EnterButton(_ sender: UIButton) {
        
        if(sender.restorationIdentifier=="OKbutton")
        {
            OKbutton()
        }
        if(sender.restorationIdentifier=="RedirectButton")
        {
            RedirectButton()
        }
    }
    
    
    
    func RedirectButton(){
        //performSegue(withIdentifier: "PlayerSeg", sender: self)
    }

    
    func OKbutton()
    {
        
        
        if infoPlayer != nil{
            testlabel.text="Ваше имя: \(String(describing: infoPlayer?.name))"
            SegButton.isHidden=false
        }
        if infoPlayer == nil{
            print("Ошибка загрузки")
        }
        //  json делается в другом потоке
        testlabel.text = String?(infoPlayer?.name ??  "Нет имени")
    }
    
    
    
    func playerloadjson( req:URLRequest) {
        //Распарсиваем json
        //var json:ItemsResponse!
        var myrequest=req
        myrequest.httpMethod="GET"
        myrequest.httpBody=Data()
        myrequest.addValue("contentType", forHTTPHeaderField: "Application/JSON")
        myrequest.setValue( "Bearer \(mykey)",forHTTPHeaderField:"Authorization")
        DispatchQueue.main.async {

        let clashTask=URLSession.shared.dataTask(with: myrequest) { (data, response, error) in
            if error==nil {
                do {
                    
                    let json=try JSONDecoder().decode(PlayerS.self, from: data!)
                    self.infoPlayer=json
                    print(self.infoPlayer as Any)
                }
                catch let error {
                    print(error)
                }
            }
            else {
                print(error ?? "Неизвестная ошибка")
            }
        }
        clashTask.resume()
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


