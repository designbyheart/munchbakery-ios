//
//  ImageEntity.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 11/30/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class ImageEntity: Object, Codable {
    
    @objc dynamic var id = NSUUID().uuidString
    @objc dynamic var displayOrder: Int = 0
    @objc dynamic var alt: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var path: String = ""
    @objc dynamic var title: String = ""
    
    @objc dynamic var createdAt: Date?
    @objc dynamic var updatedAt: Date?

    override static func primaryKey() -> String? {
        return "id"
    }

    enum CodingKeys: String, CodingKey {
        case displayOrder = "DisplayOrder"
        case alt = "PictureAlt"
        case name = "PictureName"
        case path = "PicturePath"
        case title = "PictureTitle"
    }
    
}
