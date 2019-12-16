//
//  UIButton.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 9/8/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

extension UIButton {
    
    func centerVertically(padding: CGFloat = 6.0) {
        guard
            let imageViewSize = self.imageView?.frame.size,
            let titleLabelSize = self.titleLabel?.frame.size else {
                return
        }
        
        let totalHeight = imageViewSize.height + titleLabelSize.height + padding
        
        self.imageEdgeInsets = UIEdgeInsets(
            top: -(totalHeight - imageViewSize.height),
            left: 0.0,
            bottom: 0.0,
            right: -titleLabelSize.width
        )
        
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: -imageViewSize.width,
            bottom: -(totalHeight - titleLabelSize.height),
            right: 0.0
        )
        
        self.contentEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: 0.0,
            bottom: titleLabelSize.height,
            right: 0.0
        )
    }
    
    func update(to titleColor: UIColor, backgroundColor: UIColor, title: String) {
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
    }
    
}
