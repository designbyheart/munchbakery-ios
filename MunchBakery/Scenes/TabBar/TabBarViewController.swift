//
//  TabBarViewController.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 8/25/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    // MARK: - Outlets
    @IBOutlet var sideMenuContainer: UIView!
    @IBOutlet var headerBar: HeaderBar!
    @IBOutlet var tabBarMenu: TabBarMenuView!
    @IBOutlet var menuViewController: SideMenuViewController!
    
    var tabBarHeight: CGFloat = 70
    
    // MARK: - Properties
    
    var isMenuOpen = true {
        didSet {
            let width = UIScreen.main.bounds.width
            let height = UIScreen.main.bounds.height
            
            self.tabBarMenu.isHidden = self.isMenuOpen
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.7, options:
                UIView.AnimationOptions.curveEaseInOut, animations: {
                    self.sideMenuContainer.center = CGPoint(x: self.isMenuOpen ? width / 2 : 0 - width, y:  height / 2)
                    self.sideMenuContainer.layer.shadowColor = self.isMenuOpen ? UIColor.black.cgColor : UIColor.clear.cgColor
            }) { isCompleted in
                self.menuViewController.closeMenuBtn.alpha = self.isMenuOpen ? 1 : 0
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(headerBar)
        self.updateSideMenuShadow()
        
        self.menuViewController = SideMenuViewController(nibName: SideMenuViewController.name, bundle: nil)
        self.menuViewController.tabbar = self
        self.sideMenuContainer.addSubview(menuViewController.view)
        self.view.addSubview(sideMenuContainer)
        self.headerBar.delegate = self
        
        let frameSize = self.view.frame.size
        let guide = view.safeAreaLayoutGuide
        let height = guide.layoutFrame.size.height
        
        let window = UIApplication.shared.windows[0]
        let bottomPadding = window.safeAreaInsets.bottom
        
        if self.view.hasTopNotch() {
            tabBarHeight += bottomPadding
        }
        
        self.tabBarMenu.frame = CGRect(origin: CGPoint(x: 0, y: height - tabBarHeight), size: CGSize(width: frameSize.width, height: tabBarHeight))
        self.view.addSubview(tabBarMenu)
        self.tabBarMenu.delegate = self
        self.tabBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        let topPadding = self.view.hasTopNotch() ? 10 : 0
        self.headerBar.updateLayout(CGRect(origin: CGPoint(x: 0, y: topPadding), size: CGSize(width: width, height: 135)))
        self.sideMenuContainer.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: width, height: height))
        self.isMenuOpen = false
        self.headerBar.layoutSubviews()
        self.menuViewController.view.layoutSubviews()
    }
    
    func updateSideMenuShadow() {
        self.sideMenuContainer.backgroundColor = .clear
        self.sideMenuContainer.layer.shadowColor = UIColor.black.cgColor
        self.sideMenuContainer.layer.shadowOpacity = 0.8
        self.sideMenuContainer.layer.shadowRadius = 15
    }
    
func sideMenuOptionSelected(_ item: SideMenuItems) {
        switch item {
        case .myAccount:
            self.navigateToTab(TabItem.account)
            
        case .storeLocations:
            self.navigateToTab(TabItem.locations)
        
        case .myAddress:
           self.navigateToTab(TabItem.addresses)
            
        case .aboutUs:
            self.navigateToTab(TabItem.aboutUs)
            
        case .login:
            self.navigateToTab(TabItem.login)
            
        case .logout:
            self.homeAction()
        }
    
        self.leftAction()
    }
}

extension TabBarViewController: HeaderBarProtocol {
    
    func rightAction() {
        self.navigateToTab(TabItem.cart)
    }
    
    func leftAction() {
        self.isMenuOpen = !self.isMenuOpen
    }
    
    func homeAction() {
        self.selectedIndex = TabItem.home.rawValue
        self.tabBarMenu.updateActiveButton(TabItem.home)
        NotificationCenter.default.post(name: .goHome, object: nil)
    }

}

extension TabBarViewController: TabBarMenuViewDelegate {
    
    func navigateToTab(_ index: TabItem) {
        if index == .more {
            self.leftAction()
            return
        }
        self.selectedIndex = index.rawValue
        self.tabBarMenu.updateActiveButton(index)
    }
    
}

enum TabItem: Int {
    case home = 0, categories, orders, munchBunch, more, account, addresses, locations, aboutUs, login, signUp, cart
}
