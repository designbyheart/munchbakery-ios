//
//  InputField.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 11/28/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class InputField: UITextField {
    
    @IBInspectable var padding: CGFloat = 20
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customize()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + padding, y: bounds.origin.y, width: bounds.width - padding * 2, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + padding, y: bounds.origin.y, width: bounds.width - padding * 2, height: bounds.height)
    }
    
    func customize() {
        self.layer.borderColor = UIColor.dark.cgColor
        self.roundCorners(corners: [.allCorners], radius: self.frame.size.height / 2)
        self.backgroundColor = .white
        self.layer.borderWidth = 3
        self.font = UIFont.openSansBold(self.font?.pointSize ?? 17)
    }
}
