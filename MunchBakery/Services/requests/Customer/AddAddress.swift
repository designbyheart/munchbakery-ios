//
//  AddAddress.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 12/1/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation

struct AddAddressRequest: ApiRequest {
    var method = APIMethod.post
    var baseURL = BaseURL.base
    var path = APIPath.addAddress
    var body = [String : Any]()
    var urlParams = [String: Any]()
    var requiredAuth = false
    
    init(data: [String: AnyObject]) {
        body = [
            "CustomerGuid": data["customerGUID"] as? String ?? "",
            "AddressName": data["customerGUID"] as? String ?? "",
            "Longitude": data["latitude"] as? Double ?? 0.0,
            "Latitude": data["latitude"] as? Double ?? 0.0,
            "CityId": data["cityID"] as? String ?? "",
            "DistrictId":"-1"
        ]
    }
    
}
