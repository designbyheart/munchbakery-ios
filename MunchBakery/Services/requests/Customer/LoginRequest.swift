//
//  LoginRequest.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 12/1/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation

struct LoginRequest: ApiRequest {
    var method = APIMethod.post
    var baseURL = BaseURL.base
    var path = APIPath.login
    var body = [String : Any]()
    var urlParams = [String: Any]()
    var requiredAuth = false
    
    init(_ username: String, _ password: String) {
        body = [
            "UserNameEmail": username,
            "Password": password
        ]
    }
}
