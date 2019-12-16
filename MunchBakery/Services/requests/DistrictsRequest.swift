//
//  DistrictsRequest.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 12/1/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation

//https://api.munchbakery.com/MunchBakeryAPIService.svc/GetMunchBakeryDistrict/1/76

struct DistrictsRequest: ApiRequest {
    var baseURL = BaseURL.base
    var path = APIPath.districtsList("-1", "-1")
    var method = APIMethod.get
    var body = [String : Any]()
    var urlParams = [String: Any]()
    var requiredAuth = false
    
    init(city: String = "-1") {
        self.path = APIPath.districtsList(UserDefaults.lang(), city)
    }
}
