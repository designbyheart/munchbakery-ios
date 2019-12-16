//
//  LastOrderTableFooterView.swift
//  MunchBakery
//
//  Created by Kostic on 9/30/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class LastOrderTableFooterView: UIView {
    
    // MARK: - Outlets

    @IBOutlet var contentView: UIView!
    
    // MARK: - Lifecycle methods

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
        if self.contentView != nil {
            return
        }
        Bundle.main.loadNibNamed(LastOrderTableFooterView.name, owner: self, options: nil)
        addSubview(contentView)
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.contentView.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: UIScreen.main.bounds.width, height: 133))
        
        self.layoutSubviews()
        self.layoutIfNeeded()
    }
    
}
