//
//  OrderSwitchButton.swift
//  MunchBakery
//
//  Created by Kostic on 10/2/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class OrderSwitchButton: UIButton {
    
    var isActive = false {
        didSet {
            self.updateStatus()
        }
    }
    
    func updateStatus() {
        if self.isActive {
            self.setTitleColor(.white, for: .normal)
            self.backgroundColor = .pink
            return
        }
        
        self.setTitleColor(.black, for: .normal)
        self.backgroundColor = .white
    }

}
