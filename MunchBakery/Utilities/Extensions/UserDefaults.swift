//
//  UserDefaults.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 8/25/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    enum Keys {
        static let pushToken = "pushToken"
        static let deviceID = "deviceID"
        static let lang = "lang"
    }
    
    static func store(_ value: Any?, key: String) {
        if value != nil {
            do {
                let archivedData = try? NSKeyedArchiver.archivedData(withRootObject: value!, requiringSecureCoding: true)
                UserDefaults.standard.set(archivedData, forKey: key)
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    static func read(_ key: String) -> Any? {
        let storedData = UserDefaults.standard.object(forKey: key)
        if
            let storedData = storedData as? Data,
            let resultData = ((try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(storedData)) as Any??) {
                return resultData
        }
        
        return nil
    }
    
    static func remove(_ value: Any?, key: String) {
        if value != nil {
            do {
                UserDefaults.standard.removeObject(forKey: key)
                UserDefaults.standard.synchronize()
            }
        }
    }
 
    static func lang() -> String {
        if let lang = self.read(UserDefaults.Keys.lang) {
            return "\(lang)"
        }
        return "1"
    }
    
    static func setLang(_ lang: String = "1"){
        let language = lang == "1" ? "en" : "ar"
        UserDefaults.standard.set([language], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }
}
