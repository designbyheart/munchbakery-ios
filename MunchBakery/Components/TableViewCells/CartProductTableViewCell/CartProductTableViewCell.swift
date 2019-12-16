//
//  CartProductTableViewCell.swift
//  MunchBakery
//
//  Created by Kostic on 10/9/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class CartProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var amountPicker: CustomStepperView!
    var product: OrderItemEntity?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateProduct(_ orderItem: OrderItemEntity) {
        guard let product = orderItem.product else {
            return
        }
        self.product = orderItem
        self.productNameLbl.text = product.title
        self.priceLbl.text = String(Double(orderItem.amount) * product.price) + " SAR"
        if let image = product.images.first {
            self.productImg.loadImage(image.path, placeholder: nil)
        }
        self.amountPicker.quantity = orderItem.amount
        self.amountPicker.delegate = self
    }
}

extension CartProductTableViewCell: CustomStepperViewDelegate {
    
    func itemRemoved() {
        NotificationCenter.default.post(name: .removedProduct, object: product)
    }
    
    func amountUpdated(_ amount: Int) {
        guard let product = self.product else {
            return
        }
        if amount == 0 {
            let alert = UIAlertController(title: "Remove product from cart?", message: "Are you sure?", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
                NotificationCenter.default.post(name: .removedProduct, object: product)
            }))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            if let topController = UIApplication.shared.keyWindow?.rootViewController {
                topController.present(alert, animated: true)
            }
            
        }
        
        try? RealmService.shared.realm?.safeWrite {
            product.amount = amount
            NotificationCenter.default.post(name: .updatedCart, object: product)
        }
    }
    
}
