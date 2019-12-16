//
//  ProductDetailsViewController.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 12/4/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    var product: ProductEntity?
    var orderRepo: OrderRepository?
    @IBOutlet weak var productView: ProductHero!
    @IBOutlet weak var amountPicker: AmountPicker!

    var order: OrderEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.orderRepo = OrderRepository()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.productView.setProduct(self.product)
        self.setupNotifications()
        self.amountPicker.delegate = self
    }
    
    func setupNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(goBack(_:)), name: .goHome, object: nil)
    }
    
    @objc func goBack(_ notification: Any){
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension ProductDetailsViewController: AmountPickerDelegate {
    
    func onAddToCart(_ amount: Int) {
        self.orderRepo?.addProductToOrder(self.product, amount)
        guard let tabBar = self.tabBarController as? TabBarViewController else { return }
        tabBar.navigateToTab(.cart)
    }
    
}
