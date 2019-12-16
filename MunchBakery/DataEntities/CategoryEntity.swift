//
//  CategoryEntity.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 9/3/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class CategoryEntity: Object, Codable {
    
    @objc dynamic var seoTitle: String?
    @objc dynamic var slug: String?
    @objc dynamic var categoryId: Int = 0
    @objc dynamic var seoDescription: String?
    @objc dynamic var seoKeywords: String?
    @objc dynamic var parentId: Int = 0
    @objc dynamic var displayOrder: Int = 0
    @objc dynamic var defaultImage: String?
    @objc dynamic var name: String?
    @objc dynamic var categoryDescription: String?
    @objc dynamic var type: String?
    @objc dynamic var imagePath: String = ""
    
    @objc dynamic var createdAt: Date?
    @objc dynamic var updatedAt: Date?
    
    override static func primaryKey() -> String? {
        return "categoryId"
    }
    
    enum CodingKeys: String, CodingKey {
        case seoTitle = "seo_title"
        case slug = "slug"
        case categoryId = "category_id"
        case seoDescription = "seo_description"
        case seoKeywords = "seo_keywords"
        case parentId = "parent_id"
        case displayOrder = "display_order"
        case defaultImage = "default_image"
        case name = "name"
        case categoryDescription = "description"
        case type = "type"
    }
    
}

