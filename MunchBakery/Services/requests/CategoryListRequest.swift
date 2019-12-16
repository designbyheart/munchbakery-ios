//
//  CategoryListRequest.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 9/11/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation

struct CategoryListRequest: ApiRequest {
    var baseURL = BaseURL.base
    var path = APIPath.categoryList("1")
    var method = APIMethod.get
    var body = [String : Any]()
    var urlParams = [String: Any]()
    var requiredAuth = false
    
    init() {
        self.path = APIPath.categoryList(UserDefaults.lang())
    }
}
