//
//  RegisterRequest.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 12/1/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation

//https://api.munchbakery.com/MunchBakeryAPIService.svc/RegisterMunchBakeryCustomer

struct RegisterRequest: ApiRequest {
    
    var baseURL = BaseURL.base
    var path = APIPath.register
    var method = APIMethod.post
    var body = [String : Any]()
    var urlParams = [String: Any]()
    var requiredAuth = false
    
    init(_ username: String, _ email: String, _ firstName: String, _ lastName: String, _ password: String) {
        body = [
            "UserName": username,
            "Email": email,
            "Password": password,
            "FirstName": firstName,
            "LastName": lastName
        ]
    }
    
}

