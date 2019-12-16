//
//  CitiesRequest.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 12/1/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation

//https://api.munchbakery.com/MunchBakeryAPIService.svc/GetMunchBakeryCities/1
struct CitiesRequest: ApiRequest {
    var baseURL = BaseURL.base
    var path = APIPath.citiesList("1")
    var method = APIMethod.get
    var body = [String : Any]()
    var urlParams = [String: Any]()
    var requiredAuth = false
    
    init() {
        self.path = APIPath.citiesList(UserDefaults.lang())
    }
}
