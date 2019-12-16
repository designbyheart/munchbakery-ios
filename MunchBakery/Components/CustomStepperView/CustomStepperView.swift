//
//  CustomStepperView.swift
//  MunchBakery
//
//  Created by Kostic on 10/10/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

protocol CustomStepperViewDelegate: class {
    func amountUpdated(_ amount: Int)
    func itemRemoved()
}

class CustomStepperView: UIView {
    
    // MARK: - Outlets

    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet var contentView: UIView!
    
    weak var delegate: CustomStepperViewDelegate?
    
    // MARK: - Properties
    
    var quantity = 1 {
        didSet {
            self.quantityLabel.text = String(self.quantity)
        }
    }
    private var contentViewInitialized = false
    
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
        Bundle.main.loadNibNamed(CustomStepperView.name, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.layer.cornerRadius = 10
        contentView.setBorder(with: .black, width: 1.5)
        contentViewInitialized = true
        self.backgroundColor = .clear
    }
    
    // MARK: - Actions

    @IBAction func plusButtonTapped(_ sender: UIButton) {
        quantity += 1
        self.quantityLabel.text = "\(quantity)"
        self.delegate?.amountUpdated(quantity)
    }
    
    @IBAction func minusButtonTapped(_ sender: UIButton) {
        quantity = quantity == 0 ? 0 : quantity - 1
        self.quantityLabel.text = "\(quantity)"
        self.delegate?.amountUpdated(quantity)
    }
    
}
