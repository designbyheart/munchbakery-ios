//
//  OrderTableViewCell.swift
//  MunchBakery
//
//  Created by Luka's Macbook on 24.09.19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var cakeImage: UIImageView!
    @IBOutlet weak var cakeNameLbl: UILabel!
    @IBOutlet weak var cakePriceLbl: UILabel!
    @IBOutlet weak var amountButtonOutlet: BorderButton!
    
    // MARK: - Lifecycle methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    // MARK: - Actions
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        
    }
    
    // MARK: - Public methods
    
    func updateOrderItem(_ orderItem: OrderItemEntity) {
        let product = orderItem.product
        self.cakeNameLbl.text = product?.title
        var price: Double = 0
        if let product = product {
            price = product.price * Double(orderItem.amount)
        }
        self.cakePriceLbl.text = "\(price) SAR"
        self.amountButtonOutlet.setTitle("\(orderItem.amount)", for: .normal)
    }
}

// MARK: - UIStyling methods

extension OrderTableViewCell: UIStyling {
    
    func setupViews() {
        cakeImage.layer.cornerRadius = cakeImage.frame.height / 2
    }
    
    func setupConstraints() {
        
    }
    
}
