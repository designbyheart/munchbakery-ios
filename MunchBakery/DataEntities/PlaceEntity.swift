//
//  PlaceEntity.swift
//  MunchBakery
//
//  Created by Luka's Macbook on 07.09.19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class PlaceEntity: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var distance: Double = 0.0
    @objc dynamic var workingHours: String = ""
    @objc dynamic var phoneNumber: String = ""
    
    static func initPlace(name: String, distance: Double, workingHours: String, phoneNumber: String) -> PlaceEntity {
        let place = PlaceEntity()
        place.name = name
        place.distance = distance
        place.workingHours = workingHours
        place.phoneNumber = phoneNumber
        
        return place
    }
    
}
