//
//  SignUpViewController.swift
//  MunchBakery
//
//  Created by Kostic on 10/27/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - Outlets


    @IBOutlet weak var registerBtn: ShadowButton!
    @IBOutlet weak var loginBtn: ShadowButton!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var mobileNumberTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var repeatPasswordTF: UITextField!
    @IBOutlet weak var registerSubmitBtn: ShadowButton!
    
    // MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginBtn?.isActive = true
        self.registerBtn?.isActive = false
        self.registerSubmitBtn?.roundCorners(corners: [.allCorners], radius: registerSubmitBtn.frame.size.height / 2)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showTopAndBottomBar(shouldShow: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showTopAndBottomBar(shouldShow: false)
    }
    
    // MARK: - Private methods

    private func showTopAndBottomBar(shouldShow: Bool) {
        guard let tabBar = self.tabBarController as? TabBarViewController else { return }
        tabBar.headerBar.isHidden = shouldShow
        tabBar.tabBarMenu.isHidden = shouldShow
    }
    
    // MARK: - Actions

    @IBAction func registerButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let tabBar = self.tabBarController as? TabBarViewController else { return }
        tabBar.navigateToTab(.login)
    }
    
}

// MARK: - UIStyling methods

extension SignUpViewController: UIStyling {
    
    func setupViews() {
        loginBtn.setBorder(with: .pink, width: 1)
        loginBtn.layer.cornerRadius = 5
        registerBtn.layer.cornerRadius = 5
        
        firstNameTF.setBorder(with: .black, width: 1)
        firstNameTF.layer.cornerRadius = firstNameTF.frame.height / 2
        firstNameTF.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        
        emailTF.setBorder(with: .black, width: 1)
        emailTF.layer.cornerRadius = emailTF.frame.height / 2
        emailTF.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        
        mobileNumberTF.setBorder(with: .black, width: 1)
        mobileNumberTF.layer.cornerRadius = mobileNumberTF.frame.height / 2
        mobileNumberTF.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        
        passwordTF.setBorder(with: .black, width: 1)
        passwordTF.layer.cornerRadius = passwordTF.frame.height / 2
        passwordTF.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        
        repeatPasswordTF.setBorder(with: .black, width: 1)
        repeatPasswordTF.layer.cornerRadius = repeatPasswordTF.frame.height / 2
        repeatPasswordTF.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
    }
    
    func setupConstraints() {
        
    }
    
}
