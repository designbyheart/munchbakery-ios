//
//  CartCheckoutStorePickupTableViewCell.swift
//  MunchBakery
//
//  Created by Nikola Jovanovic Simunic on 10/5/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class CartCheckoutStorePickupTableViewCell: UITableViewCell {
    
    
    //    MARK: - Outlets
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var nearestLabel: UILabel!
    @IBOutlet weak var checked: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nearestLabel.isHidden = true
        checked.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
