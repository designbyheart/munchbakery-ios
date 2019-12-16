//
//  SideMenuViewController.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 8/28/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

enum SideMenuItems: String {
    case
        myAccount = "My Account",
        myAddress = "My Address",
        storeLocations = "Store Locations",
        aboutUs = "About Us",
        login = "Login",
        logout = "Logout"
}

class SideMenuViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuContainer: UIView!
    @IBOutlet weak var menuWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var closeMenuBtn: UIButton!
    
    // MARK: - Properties
    
    let menuItems: [SideMenuItems] = [.myAccount, .myAddress, .storeLocations]
    weak var tabbar: TabBarViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: SideMenuTableViewCell.name, bundle: nil), forCellReuseIdentifier: SideMenuTableViewCell.name)
        
        self.loginBtn.setTitle("Login", for: .normal)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.menuWidthConstraint.constant = UIScreen.main.bounds.width * 0.7
        self.menuHeightConstraint.constant = UIScreen.main.bounds.height
        
        self.loginBtn.setTitle(SideMenuItems.login.rawValue, for: .normal)
    }
    
    @IBAction func shouldCloseMenu(_ sender: Any) {
        self.tabbar?.leftAction()
    }
    
    @IBAction func shouldOpenLogin(_ sender: Any) {
        self.tabbar?.sideMenuOptionSelected(.login)
    }
}

// MARK: - TableView Delegates

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: SideMenuTableViewCell.name, for: indexPath) as? SideMenuTableViewCell else {
            return UITableViewCell()
        }
        
        cell.title = menuItems[indexPath.row].rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tabbar?.sideMenuOptionSelected(menuItems[indexPath.row])
    }
    
}
