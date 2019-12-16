//
//  PricePicker.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 12/6/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class PricePickerView: UIView {

    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var amountLbl: UILabel!
    
    var amount: Int = 0 {
        didSet {
            self.amountLbl.text = String(amount)
        }
    }
    
    // MARK: - Lifecycle
    
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
        Bundle.main.loadNibNamed(PricePickerView.name, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    
         self.contentView.frame = CGRect(origin: CGPoint.zero, size: self.frame.size)
        
        self.containerView.layer.borderWidth = 2
        self.containerView.layer.borderColor = UIColor.black.cgColor
        self.containerView.layer.cornerRadius = 5
    }
    
    @IBAction func onDecrease(_ sender: Any) {
        self.amount -= amount
    }
    
    @IBAction func onIncrease(_ sender: Any) {
        self.amount += amount
    }
    
}
