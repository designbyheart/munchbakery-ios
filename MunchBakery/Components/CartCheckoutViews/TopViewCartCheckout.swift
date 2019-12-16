//
//  TopViewCartCheckout.swift
//  MunchBakery
//
//  Created by Nikola Jovanovic Simunic on 9/22/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

protocol ChangePayementProtocol: class {
    func changePayement()
}
protocol SelectedButtonProtocol: class {
    func selectedButton(tag: Int)
}

class TopViewCartCheckout: UIView {
    
    //    MARK: - Properties
    weak var delegate: ChangePayementProtocol!
    weak var selectedBtnDelegate: SelectedButtonProtocol!
    
    //    MARK: - Outlets
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var deliveryButton: UIButton!
    @IBOutlet weak var storePickupButton: UIButton!
    @IBOutlet weak var changeButton: UIButton!
    
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
    Bundle.main.loadNibNamed(TopViewCartCheckout.name, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        setupViews()
        storePickupButton.isSelected = false
        storePickupButton.layer.borderWidth = 2
        storePickupButton.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func changeBtnTapped(_ sender: Any) {
        self.delegate?.changePayement()
    }
    
    
    
    
    //    MARK: - Action Methods
    @IBAction func buttonSelect(_ sender: UIButton) {
        selectedBtnDelegate.selectedButton(tag: sender.tag)
        switch sender.tag {
        case 0:
            storePickupButton.isSelected = false
            storePickupButton.backgroundColor = UIColor.white
            storePickupButton.layer.borderWidth = 2
            storePickupButton.layer.borderColor = UIColor.black.cgColor
            deliveryButton.isSelected = true
            deliveryButton.backgroundColor = UIColor.pink
            deliveryButton.layer.borderWidth = 0
            deliveryButton.layer.borderColor = UIColor.pink.cgColor
            
        case 1:
            storePickupButton.isSelected = true
            storePickupButton.backgroundColor = UIColor.pink
            deliveryButton.isSelected = false
            deliveryButton.backgroundColor = UIColor.white
            deliveryButton.layer.borderWidth = 2
            deliveryButton.layer.borderColor = UIColor.black.cgColor
            storePickupButton.layer.borderWidth = 0
            storePickupButton.layer.borderColor = UIColor.pink.cgColor
        default: break
        }
    }
    
}

extension TopViewCartCheckout: UIStyling {
    func setupViews() {
        self.deliveryButton.layer.masksToBounds = true
        self.storePickupButton.layer.masksToBounds = true
        self.deliveryButton.layer.cornerRadius = 10
        self.storePickupButton.layer.cornerRadius = 10
    }
    
    func setupConstraints() {
        //
    }
    
    
}
