//
//  UpdateGuestCartRequest.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 12/1/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation

struct UpdateGuestCartRequest: ApiRequest {
    var path = APIPath.updateGuestCart
    var baseURL = BaseURL.base
    var method = APIMethod.post
    var body = [String : Any]()
    var urlParams = [String: Any]()
    var requiredAuth = false
}
