//
//  PayementDetails.swift
//  MunchBakery
//
//  Created by Nikola Jovanovic Simunic on 9/6/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class PaymentDetails: UIView {
    
    //    MARK: - Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var placeOrderOutlet: UIButton!
    @IBOutlet weak var viewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var myView: UIView!
    
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
        Bundle.main.loadNibNamed(PaymentDetails.name, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        setupViews()
    }
    
    //    MARK: - Static Methods
    static func showPayemenDetails(_ parentVC: UIViewController, action: Selector) -> PaymentDetails {
        let payementView = PaymentDetails.init(frame: parentVC.view.bounds)
        payementView.frame.size.width = payementView.frame.size.width * 0.8
        
        UIView.animate(withDuration: 0.1) {
            payementView.placeOrderOutlet.addTarget(parentVC, action: action, for: .touchUpInside)
            payementView.center = parentVC.view.center
            payementView.frame.origin.y -= 150
            parentVC.view.addSubview(payementView)
            payementView.contentView.layoutIfNeeded()
        }
        return payementView
    }
}

extension PaymentDetails: UIStyling {
    func setupViews() {
        placeOrderOutlet.layer.cornerRadius = 10
        myView.layer.cornerRadius = 10
        myView.layer.shadowColor = UIColor.black.cgColor
        myView.layer.shadowOpacity = 1
        myView.layer.shadowOffset = .zero
        myView.layer.shadowRadius = 10
    }
    
    func setupConstraints() {
        //
    }
    
    
}
