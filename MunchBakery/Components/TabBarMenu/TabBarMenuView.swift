//
//  TabBarMenuView.swift
//  ChatBootyNewVersion
//
//  Created by Nikola Shimun Jovanovic on 1/9/19.
//  Copyright © 2019 Nikola Shimun Jovanovic. All rights reserved.
//

import UIKit

protocol TabBarMenuViewDelegate: class {
    func navigateToTab(_ index: TabItem)
}

class TabBarMenuView: UIView {
    
    // MARK: - Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var topBorder: UIView!
    
    // MARK: - TabBar buttons
    
    @IBOutlet weak var productsBtn: TabMenuButton!
    @IBOutlet weak var ordersBtn: TabMenuButton!
    @IBOutlet weak var munchBunchBtn: TabMenuButton!
    @IBOutlet weak var moreBtn: TabMenuButton!
    
    var backColor = UIColor.clear
    
    var activeBtn: TabMenuButton? {
        didSet {
            productsBtn.isSelected = false
            ordersBtn.isSelected = false
            munchBunchBtn.isSelected = false
            moreBtn.isSelected = false
            activeBtn?.isSelected = true
        }
    }
    
    // MARK: - Properties
    var centerY: CGFloat = UIScreen.main.bounds.size.height - 35
    weak var delegate: TabBarMenuViewDelegate?
    
    var shouldPresentTopBorder = true
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInitSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInitSetup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customInitSetup()
    }
    
    func customInitSetup() {
        Bundle.main.loadNibNamed(TabBarMenuView.name, owner: self, options: nil)
        addSubview(contentView)
        self.backgroundColor = .white
        contentView.backgroundColor = .white
        
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        productsBtn.action = .categories
        ordersBtn.action = .orders
        munchBunchBtn.action = .munchBunch
        moreBtn.action = .more
    }
    
    func showMenu(_ animate: Bool = false) {
        if !animate {
            self.center = CGPoint(x: self.center.x, y: self.centerY)
            return
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.7, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.center = CGPoint(x: self.center.x, y: self.centerY)
        }) { (completed) in
            
        }
    }
    
    func hideMenu(animate: Bool = false) {
        let yPosition = self.center.y * 2
        if !animate {
            self.center = CGPoint(x: self.center.x, y: yPosition)
            return
        }
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.center = CGPoint(x: self.center.x, y: yPosition)
        }) { (completed) in
            
        }
    }
    
}

extension TabBarMenuView {
    
    @IBAction func navigate(_ sender: TabMenuButton) {
        guard let action = sender.action else {
            return
        }
        
//        if sender.action == self.activeBtn?.action && action != .more {
//            return
//        }
        
        self.activeBtn?.isActive = false
        
        switch action {
        case .categories:
            self.activeBtn = productsBtn
            NotificationCenter.default.post(name: Notification.Name.openCategories, object: nil)
            self.delegate?.navigateToTab(.categories)
            
        case .orders:
            self.activeBtn = ordersBtn
            self.delegate?.navigateToTab(.orders)
            
        case .munchBunch:
            self.activeBtn = munchBunchBtn
            self.delegate?.navigateToTab(.munchBunch)
            
        case .more:
            self.activeBtn = moreBtn
            self.delegate?.navigateToTab(.more)
            
        default:
            self.activeBtn = nil
            self.delegate?.navigateToTab(action)
        }
    }
    
    func updateActiveButton(_ index: TabItem) {
        switch index {
        case .categories:
            self.activeBtn = productsBtn
        case .orders:
            self.activeBtn = ordersBtn
        case .munchBunch:
            self.activeBtn = munchBunchBtn
        case .more:
            self.activeBtn = moreBtn
            
        default:
            break
        }
        
    }
    
}
