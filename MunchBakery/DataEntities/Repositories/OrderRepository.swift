//
//  OrderRepository.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 11/28/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation

struct OrderRepository {
    func loadFromAPI(completion: @escaping ([OrderEntity], String?) -> Void) {
        ApiManager.shared.sendRequest(CategoryListRequest()) { (result) in
            switch result {
            case .success(let data):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data["responseData"]!, options: .prettyPrinted)
                    //                           let orders = try JSONDecoder().decode([OrderEntity].self, from: jsonData)
                    //                           DispatchQueue.main.async {
                    //                               completion(orders, nil)
                    //                           }
                } catch {
                    DispatchQueue.main.async {
                        completion([OrderEntity](), error.localizedDescription)
                    }
                }
            case .error(let error):
                completion([OrderEntity](), error)
                
            case .errorWithDictionary(let errorDictionary):
                print(errorDictionary)
                completion([OrderEntity](), "error")
            }
            print(result)
        }
    }
    
    func getActiveOrder() -> OrderEntity? {
        let activeOrder = RealmService.shared.loadSingle(OrderEntity.self) as? OrderEntity ?? OrderEntity()
        return activeOrder
    }
    
    func addProductToOrder(_ product: ProductEntity?, _ amount: Int) {
        guard let product = product else { return }
        let order = self.getActiveOrder()
        var selectProduct: OrderItemEntity?
        var totalAmount: Int = 0
        var totalPrice: Double = 0
        
        try? RealmService.shared.realm?.safeWrite {
            if let products = order?.products {
                
                for orderItem in products {
                    if orderItem.product?.id == product.id {
                        selectProduct = orderItem
                        selectProduct?.amount = amount
                        
                    }
                    totalAmount += orderItem.amount
                    totalPrice += orderItem.product?.price ?? 0 * Double(orderItem.amount)
                }
            }
            
            if selectProduct == nil {
                let orderItem = OrderItemEntity.initOrderItem(product: product, amount: amount)
                orderItem.amount = amount
                order?.products.append(orderItem)
                totalAmount = totalAmount + amount
                totalPrice += orderItem.product?.price ?? 0 * Double(orderItem.amount)
            }
            selectProduct?.amount = amount
            order?.totalAmount = totalAmount
            order?.totalPrice = totalPrice
        }
        
        NotificationCenter.default.post(name: .updatedCartAmount, object: totalAmount)
        
        if let order = order {
            RealmService.shared.store(order)
        }
    }
    
    func updateOrderStatus() {
        let activeOrder = self.getActiveOrder()
        NotificationCenter.default.post(name: .updatedCartAmount, object: activeOrder?.totalAmount ?? 0)
    }
    
}
