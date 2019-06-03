//
//  RObjects.swift
//  CourseWork
//
//  Created by Айрат Туктамышев on 31/05/2019.
//  Copyright © 2019 Айрат Туктамышев. All rights reserved.
//

import UIKit
import RealmSwift

class CardsRealm: Object {
    @objc dynamic var name:String?
    @objc dynamic var maxLevel = 0
    @objc dynamic var iconUrls:String?
    
    override static func primaryKey() -> String? {
        return "name"
    }
    

}
