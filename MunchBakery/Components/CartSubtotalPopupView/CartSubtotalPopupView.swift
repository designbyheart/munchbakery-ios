//
//  CartSubtotalPopupView.swift
//  MunchBakery
//
//  Created by Kostic on 10/10/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class CartSubtotalPopupView: UIView {
    
    // MARK: - Outlets

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var proceedToCheckoutButtonOutlet: UIButton!
    
    // MARK: - Properties

    private var contentViewInitialized = false
    
    var totalPrice: Double = 0 {
        didSet {
            self.priceLabel.text = String(totalPrice) + " SAR"
        }
    }
    
    var totalItems: Int = 0 {
        didSet {
            self.numberOfItemsLabel.text = "Subtotal (" + String(totalItems) + " items): "
        }
    }
    
    // MARK: - Lifecycle methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // MARK: - Customize init
    
    private func commonInit() {
        if contentViewInitialized {
            return
        }
        Bundle.main.loadNibNamed(CartSubtotalPopupView.name, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.layer.cornerRadius = 20
        contentView.dropShadow(color: .black, opacity: 0.2, offSet: .zero, radius: 15, scale: false)
        setupViews()
        contentViewInitialized = true
    }
    
}

// MARK: - UIStyling methods

extension CartSubtotalPopupView: UIStyling {
    
    func setupViews() {
        proceedToCheckoutButtonOutlet.layer.cornerRadius = 10
        proceedToCheckoutButtonOutlet.layer.masksToBounds = true
    }
    
    func setupConstraints() {
        
    }
    
}
