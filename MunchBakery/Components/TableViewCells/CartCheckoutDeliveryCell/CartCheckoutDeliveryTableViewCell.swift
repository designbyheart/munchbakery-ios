//
//  CartCheckoutDeliveryTableViewCell.swift
//  MunchBakery
//
//  Created by Nikola Jovanovic Simunic on 10/5/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class CartCheckoutDeliveryTableViewCell: UITableViewCell {

    @IBOutlet weak var descOfLocation: UITextField!
    @IBOutlet weak var nameOfLocation: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       setupViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CartCheckoutDeliveryTableViewCell: UIStyling {
    func setupViews() {
        descOfLocation.borderStyle = .roundedRect
        descOfLocation.layer.borderWidth = 2
        descOfLocation.layer.borderColor = UIColor.black.cgColor
        descOfLocation.layer.cornerRadius = 15
        
        nameOfLocation.borderStyle = .roundedRect
        nameOfLocation.layer.borderWidth = 2
        nameOfLocation.layer.borderColor = UIColor.black.cgColor
        nameOfLocation.layer.cornerRadius = 15
    }
    
    func setupConstraints() {
        //
    }
    
    
}
