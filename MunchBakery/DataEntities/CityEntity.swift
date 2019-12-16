//
//  LocationEntity.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 12/1/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class CityEntity: Object {
    
    //@objc dynamic var productID: String = NSUUID().uuidString
    @objc dynamic var id: Int = 0
    @objc dynamic var cityID = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var createdAt: Date?
    @objc dynamic var updatedAt: Date?
    @objc dynamic var displayOrder: Int = 0
    
    override static func primaryKey() -> String? {
        return "cityID"
    }
    
    static func initCity(_ name: String, _ id: Int, _ displayOrder: Int) -> CityEntity {
        let city = CityEntity()
        city.name = name
        city.displayOrder = displayOrder
        city.id = id
        
        return city
    }
}
