//
//  ReccProducts.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 11/27/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation

struct ProductsListRequest: ApiRequest {
    var path: APIPath
    var baseURL = BaseURL.base
    var method = APIMethod.get
    var body = [String : Any]()
    var urlParams = [String: Any]()
    var requiredAuth = false
    
    init(_ categoryID: String = "-1") {
        self.path = APIPath.products("\(UserDefaults.lang())/\(categoryID)/-1/-1/-2/-1")
    }
}
