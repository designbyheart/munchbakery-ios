//
//  CartHeader.swift
//  MunchBakery
//
//  Created by Nikola Jovanovic Simunic on 10/5/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class CartHeader: UIView {
    @IBOutlet var contentView: UIView!
    
    //    MARK: - Lifecycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    // MARK: - Customize init
    private func commonInit() {
        Bundle.main.loadNibNamed(CartHeader.name, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    

}
