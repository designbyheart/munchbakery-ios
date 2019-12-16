//
//  OnboardingView.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 9/8/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class OnboardingView: UIView {
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet weak var locateMeBtn: BorderButton!
    @IBOutlet weak var chooseCityBtn: BorderButton!
    
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
        Bundle.main.loadNibNamed(OnboardingView.name, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        self.locateMeBtn.textColor = .white
        self.locateMeBtn.borderColor = .white
        
        self.chooseCityBtn.textColor = .white
        self.chooseCityBtn.borderColor = .white
        
         self.contentView.frame = CGRect(origin: CGPoint.zero, size: self.frame.size)
    }
    
}
