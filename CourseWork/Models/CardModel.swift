//
//  Model.swift
//  CourseWork
//
//  Created by Айрат Туктамышев on 15/05/2019.
//  Copyright © 2019 Айрат Туктамышев. All rights reserved.
//

import UIKit

struct  ItemsResponse: Decodable {
    let items:[ClashCards]
    
}


struct ClashCards:Decodable
{
    var name:String
    var id:Int
    
    var maxLevel:Int
    var iconUrls:Medium
    
    struct Medium:Decodable {
        var medium:String?
    }
}


 
 
            
       
    
    

