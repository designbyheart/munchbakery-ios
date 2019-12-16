//
//  AuthManager.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 8/25/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation

struct AuthManager {
    
    static func accessToken() -> String? {
        if let token = UserDefaults.read("token") as? String {
            return token
        }
        return nil
    }
    
    static func userToken() -> String? {
        if
            let path = Bundle.main.path(forResource: "minibarConfig", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: path) as? [String: String],
            let userToken = dict["user_token"] {
            return userToken
        }
        
        return nil
    }
    
    static func credentials(_ keys: [String] = []) -> [String: Any] {
        if
            let path = Bundle.main.path(forResource: "minibarConfig", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: path) as? [String: String] {
            if keys.count > 0 {
                var credentialList = [String: String]()
                for (key, value) in dict {
                    if keys.contains(key) {
                        credentialList[key] = value
                    }
                }
                return credentialList
            }
            
            return dict
        }
        
        return [:]
    }
    
}
