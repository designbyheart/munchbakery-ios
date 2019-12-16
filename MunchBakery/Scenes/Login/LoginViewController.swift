//
//  LoginViewController.swift
//  MunchBakery
//
//  Created by Kostic on 10/27/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var emailTF: InputField!
    @IBOutlet weak var passwordTF: InputField!
    @IBOutlet weak var registerBtn: ShadowButton!
    @IBOutlet weak var loginBtn: ShadowButton!
    @IBOutlet weak var submitBtn: ShadowButton!
    @IBOutlet weak var loginBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var errorLbl: UILabel!
    var activeField: UITextField!
    var userRepo: UserRepository?
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitBtn.roundCorners(corners: [.allCorners], radius: submitBtn.frame.size.height / 2)
        
        userRepo = UserRepository()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.loginBtn?.isActive = false
        self.registerBtn?.isActive = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIWindow.keyboardWillHideNotification, object: nil)
        showTopAndBottomBar(shouldShow: false)
    }
    
    // MARK: - Notifications
    @objc func keyboardWillShow(notification: NSNotification) {
        self.loginBottomConstraint.constant = -120
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.loginBottomConstraint.constant = 0
    }
    
    // MARK: - Private methods
    
    private func showTopAndBottomBar(shouldShow: Bool) {
        guard let tabBar = self.tabBarController as? TabBarViewController else { return }
        tabBar.headerBar.isHidden = shouldShow
        tabBar.tabBarMenu.isHidden = shouldShow
    }
    
    // MARK: - Actions
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        self.submitLoginForm()
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        guard let tabBar = self.tabBarController as? TabBarViewController else { return }
        tabBar.navigateToTab(.signUp)
        //        guard let vc = UIStoryboard.init(name: "Authentication", bundle: nil).instantiateViewController(withIdentifier: SignUpViewController.name) as? SignUpViewController else {
//            return
//        }
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func submitLoginForm() {
        let email = emailTF.text ?? ""
        self.errorLbl.text = ""
        
        self.userRepo?.submitLogin(email, self.passwordTF?.text, completion: { (success, error) in
            print(success, error)
            if let error = error {
                self.errorLbl.text = error
                return
            }
            // TODO: handle sucessfull login
        })
        if let activeField = activeField,
            activeField.isFirstResponder {
            activeField.resignFirstResponder()
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    // Mark: - TextField delegates
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.activeField = textField
        self.errorLbl.text = ""
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.submitLoginForm()
        return true
    }
    
}

