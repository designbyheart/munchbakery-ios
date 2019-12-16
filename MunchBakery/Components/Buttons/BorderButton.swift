//
//  BorderButton.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 8/28/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class BorderButton: UIButton {

    @IBInspectable public var borderColor: UIColor = .black {
        didSet {
            self.layer.borderColor = self.borderColor.cgColor
        }
    }

    public var borderSize: CGFloat = 3 {
         didSet {
            self.layer.borderWidth = self.borderSize
         }
     }
    
    public var textColor: UIColor = .black {
        didSet {
            self.setTitleColor(self.textColor, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.customize()
    }
    
    func customize() {
        self.layer.borderWidth = 3
        self.layer.cornerRadius = self.frame.size.height * 0.25
        self.layer.borderColor = UIColor.black.cgColor
        
//        self.titleLabel?.font = UIFont.openSansBold(self.titleLabel?.font.pointSize ?? 15)
        self.setTitleColor(.black, for: .normal)
    }
    
}
