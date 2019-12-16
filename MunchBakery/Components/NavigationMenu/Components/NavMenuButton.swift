//
//  NavMenuButton.swift
//  ChatBootyNewVersion
//
//  Created by Pedja Jevtic on 1/13/19.
//  Copyright © 2019 Nikola Shimun Jovanovic. All rights reserved.
//

import UIKit

enum NavAction: String {
    case explore, following, search
}

class NavMenuButton: UIButton {

    var titleColor: NavigationMenuColor = .white
    var border: CALayer?
    var action: NavAction?
    
    var isActive = false {
        didSet {
            self.updateSelection()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.border = self.addBottomBorderWithColor(color: .clear, width: 2)
    }
    
    func updateSelection() {
        if self.isActive {
//            self.border?.backgroundColor = UIColor.primaryGreen.cgColor
            return
        }
        
        self.border?.backgroundColor = UIColor.clear.cgColor
    }

}
