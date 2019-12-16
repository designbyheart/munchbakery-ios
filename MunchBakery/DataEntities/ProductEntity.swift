//
//  ProductEntity.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 9/3/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class ProductEntity: Object {
    
    @objc dynamic var productID: String = NSUUID().uuidString
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = "Product name"
    @objc dynamic var price: Double = 0.0
    @objc dynamic var productDescription: String = ""
    @objc dynamic var category: CategoryEntity?
    @objc dynamic var createdAt: Date?
    @objc dynamic var updatedAt: Date?
    @objc dynamic var displayOrder: Int = 0
    let images = List<ImageEntity>()
    
    override static func primaryKey() -> String? {
        return "productID"
    }
    
    static func initProduct(title: String, price: Double) -> ProductEntity {
        let product = ProductEntity()
        product.title = title
        product.price = price
        
        return product
    }
    
    func loadImage(_ imageView: UIImageView) {
        if self.images.count > 0 {
            let image = self.images.first
            imageView.loadImage(image?.path, placeholder: nil)
        }
    }
}
