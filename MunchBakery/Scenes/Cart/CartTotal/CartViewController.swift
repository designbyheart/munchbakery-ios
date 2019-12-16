//
//  CartViewController.swift
//  MunchBakery
//
//  Created by Kostic on 10/9/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class CartViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var cartTableView: CartTableView!
    @IBOutlet weak var cartPopup: CartSubtotalPopupView!
    
    var order: OrderEntity?
    var orderItems = [OrderItemEntity]()
    
    // MARK: - Properties
    
    var orderRepository: OrderRepository?
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.orderRepository = OrderRepository()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.order = orderRepository?.getActiveOrder()
        self.cartTableView.items = order?.products.compactMap({ $0 }) ?? []
        cartPopup.totalPrice = self.order?.totalPrice ?? 0
        cartPopup.totalItems = self.order?.totalAmount ?? 0
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateShoppingCart(_:)), name: .updatedCart, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.removedProduct(_:)), name: .removedProduct, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func updateShoppingCart(_ notification: Notification) {
        var totalAmount: Int = 0
        var totalPrice: Double = 0
        if let items = order?.products {
            for item in items {
                totalAmount += item.amount
                totalPrice += (item.product?.price ?? 0) * Double(item.amount)
            }
        }

        self.order?.totalAmount = totalAmount
        self.order?.totalPrice = totalPrice
        self.cartTableView.items = order?.products.compactMap({ $0 }) ?? []
        cartPopup.totalPrice = self.order?.totalPrice ?? 0
        cartPopup.totalItems = self.order?.totalAmount ?? 0
        NotificationCenter.default.post(name: .updatedCartAmount, object: totalAmount)
    }
    
    @objc func removedProduct(_ notification: Notification) {
        var totalAmount: Int = 0
        if let orderItem = notification.object as? OrderItemEntity {
            try? RealmService.shared.realm?.safeWrite {
                var i = 0
                for item in order?.products ?? List<OrderItemEntity>() {
                    if item.id == orderItem.id {
                        self.order?.products.remove(at: i)
                    } else {
                        totalAmount += item.amount
                    }
                    i += 1
                }
                self.cartTableView.items = order?.products.compactMap({ $0 }) ?? []
                NotificationCenter.default.post(name: .updatedCartAmount, object: totalAmount)
            }
        }
    }
    
}
