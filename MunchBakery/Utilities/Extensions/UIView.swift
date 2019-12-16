//
//  UIView.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 8/30/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import UIKit

extension UIView {
    
    func hide() {
        self.isHidden = true
    }
    
    func show() {
        self.isHidden = false
    }
    
    static var name: String {
        return String(describing: self)
    }
    
    func dropShadow(color: UIColor, opacity: Float = 0.1, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func hasTopNotch() -> Bool {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        }
        return false
    }
    
    func setBorder(with color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        layer.masksToBounds = true
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
        layer.cornerRadius = radius
    }
    func roundCorners(_ radius: CGFloat) {
        layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func roundCornersAndSetBorders(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        clipsToBounds = true
        layer.masksToBounds = true
        layer.mask = mask
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = radius
    }
    
    func shadow(radius: CGFloat = 10, opacity: Float = 0.3, shadowColor: UIColor = .black, offset: CGSize = .zero) {
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false
    }
    
}
