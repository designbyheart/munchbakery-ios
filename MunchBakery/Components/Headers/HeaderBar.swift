//
//  HeaderBar.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 8/30/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//
import UIKit

protocol HeaderBarProtocol: class {
    func rightAction()
    func leftAction()
    func homeAction()
}

class HeaderBar: UIView {
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet weak var inCartItemsLbl: UILabel!
    
    weak var delegate: HeaderBarProtocol!
    var isObserving = false
    
    var inCartItems = 0 {
        didSet {
            self.inCartItemsLbl.text = String(inCartItems)
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
        if self.contentView != nil {
            return
        }
        Bundle.main.loadNibNamed(HeaderBar.name, owner: self, options: nil)
        addSubview(contentView)
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.contentView.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: UIScreen.main.bounds.width, height: 110))
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.inCartItemsLbl.layer.cornerRadius = self.inCartItemsLbl.frame.size.width / 2
        self.inCartItemsLbl.clipsToBounds = true
        
        self.layoutSubviews()
        self.layoutIfNeeded()
        
        if self.isObserving == false {
            NotificationCenter.default.addObserver(self, selector: #selector(updateCartAmount(_:)), name: .updatedCartAmount, object: nil)
            self.isObserving = true
        }
        
    }
    
    func updateLayout(_ frame: CGRect) {
        self.frame = frame
        self.contentView.frame = frame
        showShadow()
        self.layoutSubviews()
        self.layoutIfNeeded()
        
    }
    
    func showShadow() {
        self.contentView.dropShadow(color: .black, opacity: 0.05, offSet: .zero, radius: 10, scale: true)
    }
    
    @IBAction func onPressHomeButton() {
        self.delegate?.homeAction()
    }
    
    @IBAction func onPressLeft() {
        self.delegate?.leftAction()
    }
    
    @IBAction func onPressRight() {
        self.delegate?.rightAction()
    }
 
    @objc func updateCartAmount(_ notification: Notification) {
        if let totalAmount = notification.object as? Int {
            self.inCartItems = totalAmount
        }
    }
    
}

