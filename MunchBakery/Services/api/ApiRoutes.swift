//
//  ApiRoutes.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 8/25/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation

enum BaseURL: String {
    case
    base = "https://api.munchbakery.com/MunchBakeryAPIService.svc/"
}

enum APIPath: Equatable {
    case
    register,
    login,
    refreshToken,
    userDetails(_ email: String),
    forgotPassword,
    categoryList(_ lang: String),
    products(_ products: String),
    districtsList(_ lang: String, _ city: String),
    citiesList(_ lang: String),
    zonesList,
    customerOrders(_ token: String),
    orderProducts(_ orderID: String, _ lang: String),
    storesCheckout,
    shopingCartItems,
    addAddress,
    getAddress,
    guestRegister,
    updateCart,
    updateGuestCart,
    createOrder,
    timeslots
    
    var path: String {
        switch self {
        case .register:
            return "RegisterMunchBakeryCustomer"
        
        case .login:
            return "ValidateMunchBakeryLogin"
            
        case .refreshToken:
            return "user/auth/refresh-token"
            
        case .userDetails(let search): return "details/\(search)"
            
        case .forgotPassword:
            return "forgot-password"
        
        case .categoryList(let lang):
            return "GetMunchBakeryCategories/\(lang)"
        
        case .products(let products): return "GetMunchBakeryProducts/\(products)"
        
        case .citiesList(let lang):
            return "GetMunchBakeryCities/\(lang)"
            
        case .districtsList(let lang, let city):
            return "GetMunchBakeryDistrict/\(lang)/\(city)"
            
        case .zonesList:
            return "GetStockZones"
            
        case .customerOrders(let token):
            return "GetCustomerOrderMunchBakery/\(token)"
            
        case .orderProducts(let orderID, let lang):
            return "GetOrderProductsByOrderIdMunchBakery/\(orderID)/\(lang)"
            
        case .storesCheckout:
            return "GetMunchBakeryStoresPickupCheckout"
            
        case .shopingCartItems:
            return "GetShoppingCartItemsByCustomerStoreMunchBakery"
            
        case .addAddress:
            return "AddCustomerAddress"
            
        case .getAddress:
            return "GetCustomerAddresses"
            
        case .guestRegister:
            return "RegisterMunchBakeryGuestCustomer"
            
        case .updateCart:
            return "AddUpdateShoppingCartItemMunchBakery"
        
        case .updateGuestCart:
            return "AddUpdateShoppingCartItemMunchBakery"
            
        case .createOrder:
            return "CreateOrderMunchBakery"
    
        case .timeslots:
            return "GetTimeSlotsMunchBakery"
        }
    }
    
}

extension APIPath {
    
    public static func ==(lhs: APIPath, rhs: APIPath) -> Bool {
        switch (lhs,rhs) {
//        case (.categoryList, .categoryList):
//            return true
            
        default:
            return false
        }
    }
    
}
