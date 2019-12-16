//
//  UITableViewCell.swift
//  MunchBakery
//
//  Created by Luka's Macbook on 09.09.19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    func round(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
}
