//
//  CartHeaderButton.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 8/30/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class CartHeaderButton: UIButton {
    
    private var amountLbl: UILabel?
    var amount: Int = 0 {
        didSet {
            guard let amountLbl = self.amountLbl else {
                return
            }
            amountLbl.text = String(self.amount)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.customize()
    }
    
    func customize() {
        self.imageView?.image = UIImage.init(named: "cartIcon")
        
        if self.amountLbl == nil {
            let lblSize: CGFloat = 40
            let amountLbl = UILabel.init(frame: CGRect(origin: .zero, size: CGSize(width: lblSize, height: lblSize)))
            amountLbl.font = UIFont.openSansBold(14)
            amountLbl.textColor = .white
            amountLbl.backgroundColor = UIColor.pink
            amountLbl.layer.cornerRadius = lblSize / 2
            self.amount = 0
            self.amountLbl = amountLbl
            
            self.layer.addSublayer(amountLbl.layer)
        }
    }
        
}
