//
//  NavigationView.swift
//  ChatBootyNewVersion
//
//  Created by Nikola Shimun Jovanovic on 1/9/19.
//  Copyright © 2019 Nikola Shimun Jovanovic. All rights reserved.
//

import UIKit

enum NavigationMenuColor: String {
    case white, gray
}

protocol NavigationMenuDelegate: class {
    func navigateToHeaderTab(_ index: NavAction)
}

class NavigationMenuView: UIView {
    
    @IBOutlet var contentView: UIView!
    var centerY: CGFloat = 80
    var color: NavigationMenuColor = .white
    
    @IBOutlet weak var searchBtn: NavMenuButton!
    @IBOutlet weak var followingBtn: NavMenuButton!
    @IBOutlet weak var exploreBtn: NavMenuButton!
    
    weak var delegate: NavigationMenuDelegate?
    
    var activeBtn: NavMenuButton? {
        didSet {
            activeBtn?.isActive = true
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
        Bundle.main.loadNibNamed(NavigationMenuView.name, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        self.backgroundColor = .clear
        
        self.searchBtn.action = .search
        self.exploreBtn.action = .explore
        self.followingBtn.action = .following
    }
    
}

// MARK: - Presentation methods

extension NavigationMenuView {
    
    func hideMenu(animate: Bool = false) {
        if !animate {
            self.center = CGPoint(x: self.center.x, y: -120)
            return
        }
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.center = CGPoint(x: self.center.x, y: -120)
        }) { (completed) in
            
        }
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
    
}

// MARK: - Handling button actions

extension NavigationMenuView {
    
    @IBAction func navigate(_ sender: NavMenuButton) {
        guard let action = sender.action else {
            return
        }
        
        if sender.action == self.activeBtn?.action {
            return
        }
        
        self.activeBtn?.isActive = false
        switch action {
            case .explore:
                self.activeBtn = exploreBtn
                self.delegate?.navigateToHeaderTab(.explore)
            case .search:
                self.activeBtn = searchBtn
                self.delegate?.navigateToHeaderTab(.search)
            case .following:
                self.activeBtn = followingBtn
                self.delegate?.navigateToHeaderTab(.following)
        }
    
    }
    
    func changeColor(color: UIColor) {
        self.searchBtn.setTitleColor(color, for: .normal)
        self.exploreBtn.setTitleColor(color, for: .normal)
        self.followingBtn.setTitleColor(color, for: .normal)
    }
    
    func setActiveBtn(action: NavAction) {
        self.activeBtn?.isActive = false
        self.activeBtn = nil
        switch action {
            case .explore:
                self.activeBtn = exploreBtn
            case .search:
                self.activeBtn = searchBtn
            case .following:
                self.activeBtn = followingBtn
        }
    }
    
}
