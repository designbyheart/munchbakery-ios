//
//  UIFont.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 8/30/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func museo(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Museo Sans Display", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func openSans(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Open-Sans", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func openSansBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "OpenSans-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func openSansSemiBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "OpenSans-SemiBold", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
}
