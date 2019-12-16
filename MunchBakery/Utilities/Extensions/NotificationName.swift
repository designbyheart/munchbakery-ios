//
//  NotificationName.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 11/28/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation

extension Notification.Name {
    
    public static let openCategories = Notification.Name(rawValue: "openCategories")
    public static let goHome = Notification.Name(rawValue: "goHome")
    public static let addToCart = Notification.Name(rawValue: "addToCart")
    public static let addedToCart = Notification.Name(rawValue: "addedToCart")
    public static let dismissPicker = Notification.Name(rawValue: "dismissPicker")
    public static let updatedCart = Notification.Name(rawValue: "updatedCart")
    public static let updatedCartAmount = Notification.Name(rawValue: "updatedCartAmount")
    public static let removedProduct = Notification.Name(rawValue: "removedProduct")
}
