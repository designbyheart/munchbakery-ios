//
//  OrderEntity.swift
//  MunchBakery
//
//  Created by Luka's Macbook on 24.09.19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class OrderEntity: Object {
    
    dynamic var products = List<OrderItemEntity>()
    
    @objc dynamic var createdAt: Date?
    @objc dynamic var updatedAt: Date?
    @objc dynamic var status: String = "active"
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var totalAmount: Int = 0
    @objc dynamic var totalPrice: Double = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    static func initOrder(products: [OrderItemEntity], amount: Int) -> OrderEntity {
        let order = OrderEntity()
//        order.products.append(objectsIn: products)
        return order
    }
    
}
