//
//  ShadowButton.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 11/28/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

class ShadowButton: UIButton {
    
    var color: UIColor? {
        didSet{
            self.backgroundColor = color
        }
    }
    
    var isActive = false {
        didSet{
            self.customize()
        }
    }
    
    func customize(){
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.dark.cgColor
        self.backgroundColor = .white
        self.setTitleColor(.dark, for: .normal)
        self.roundCorners(corners: [.allCorners], radius: 10)
        
        if isActive == true {   
            let activeColor = UIColor.activeGreen
            self.setTitleColor(.white, for: .normal)
            let size = self.frame.size
            self.setBackgroundImage(activeColor.imageWithColor(width: size.width, height: size.height), for: .normal)
            self.dropShadow(color: .dark, opacity: 0.9, offSet: CGSize(width: 2, height: 2), radius: 0, scale: true)
            self.layer.borderWidth = 0
        }
    }

}
