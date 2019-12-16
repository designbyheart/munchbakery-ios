//
//  Timeslots.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 12/1/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation

struct TimeslotsRequest: ApiRequest {
    var baseURL = BaseURL.base
    var path = APIPath.timeslots
    var method = APIMethod.get
    var body = [String : Any]()
    var urlParams = [String: Any]()
    var requiredAuth = false
    
    init() {
        self.path = APIPath.citiesList(UserDefaults.lang())
    }
}

