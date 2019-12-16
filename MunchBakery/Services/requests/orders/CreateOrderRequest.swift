//
//  CreateOrderRequest.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 12/1/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation

struct CreateOrderRequest: ApiRequest {
    var method = APIMethod.post
    var path = APIPath.createOrder
    var baseURL = BaseURL.base
    var body = [String : Any]()
    var urlParams = [String: Any]()
    var requiredAuth = false
}
