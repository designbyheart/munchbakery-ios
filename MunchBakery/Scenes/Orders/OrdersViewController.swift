//
//  OrdersViewController.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 9/8/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class OrdersViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var ordersTableView: OrdersTableView!
    
    // MARK: - Properties
    
    let orderRepository = OrderRepository()
    var order: OrderEntity?
    
    var orderDataItems = [OrderItemEntity]() {
        didSet {
            self.ordersTableView?.orderDataItems = self.orderDataItems
        }
    }
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ordersTableView.showEmptyData = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.order = orderRepository.getActiveOrder()
        self.orderDataItems = order?.products.compactMap { $0 } ?? []
    }
    
    // MARK: - Private methods
    
    //    private func loadClosures() {
    //        ordersTableView.didSelectRow = { [weak self] (row) in
    //            guard let strongSelf = self else {
    //                return
    //            }
    //
    //            let vc = LastOrderViewController.init(nibName: "LastOrderViewController", bundle: nil)
    //            strongSelf.navigationController?.pushViewController(vc, animated: true)
    //        }
    //    }
    
}

extension OrdersViewController: OrdersTableViewDelegate {
    func didSelect(_ orderData: OrderEntity) {
        print(orderData)
    }
        
}
