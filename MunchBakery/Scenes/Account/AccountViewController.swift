//
//  AccountViewController.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 9/9/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var editProfileButtonOutlet: UIButton!
    @IBOutlet weak var changeToArabicButtonOutlet: UIButton!
    
    // MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        self.usernameLbl.text = "Basheer"
        self.phoneNumberLbl.text = "123123123"
    }
    
}

// MARK: - UIStyling methods

extension AccountViewController: UIStyling {
    
    func setupViews() {
        editProfileButtonOutlet.layer.cornerRadius = editProfileButtonOutlet.frame.height * 0.25
        editProfileButtonOutlet.setBorder(with: .pink, width: 3)
        editProfileButtonOutlet.setTitleColor(.pink, for: .normal)
        changeToArabicButtonOutlet.layer.cornerRadius = 10
    }
    
    func setupConstraints() {

    }
    
}
