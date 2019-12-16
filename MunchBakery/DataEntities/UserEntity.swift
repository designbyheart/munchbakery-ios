//
//  UserEntity.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 11/28/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class UserEntity: Object {
    
    @objc dynamic var email: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var phone: String = ""
    
    static func initUser(email: String, name: String? = "", phone: String? = "") -> UserEntity {
        let user = UserEntity()
        user.email = email
        user.phone = phone ?? ""
        user.name = name ?? ""
        
        return user
    }
    
}
