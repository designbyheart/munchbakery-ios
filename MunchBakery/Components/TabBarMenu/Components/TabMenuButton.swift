//
//  TabMenuBtton.swift
//  ChatBooty
//
//  Created by Pedja Jevtic on 1/16/19.
//  Copyright © 2019 Nikola Shimun Jovanovic. All rights reserved.
//

import UIKit

enum TabBarMode {
    case light, dark
}

class TabMenuButton: UIButton {

    var titleColor: NavigationMenuColor = .white
    var action: TabItem?
    
    var activeImageName: String?
    var highlightedImageName: String?
    var mode: TabBarMode = .light {
        didSet {
            self.imageMode(self.mode)
        }
    }
    
    var isActive = false {
        didSet {
            self.isSelected = isActive
            if !isActive {
                self.isHighlighted = mode == .dark
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.centerVertically()
        self.setTitleColor(UIColor.init(hexString: "#989898"), for: .normal)
        self.setTitleColor(UIColor.pink, for: .selected)
    }
    
    func updateSelection() {
        
    }

    func imageMode(_ mode: TabBarMode) {
        switch mode {
        case .dark:
            self.isHighlighted = true
        default:
            self.isHighlighted = false
        }
    }
    
}
