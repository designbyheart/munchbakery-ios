//
//  OrderItemEntity.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 12/4/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class OrderItemEntity: Object {
    
    @objc dynamic var product: ProductEntity?
    @objc dynamic var amount: Int = 0
    @objc dynamic var createdAt: Date?
    @objc dynamic var updatedAt: Date?
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var productID: Int = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    static func initOrderItem(product: ProductEntity, amount: Int) -> OrderItemEntity {
        let orderItem = OrderItemEntity()
        orderItem.product = product
        orderItem.amount = amount
        orderItem.productID = product.id

        return orderItem
    }
    
}
