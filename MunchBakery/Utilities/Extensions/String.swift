//
//  String.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 11/28/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation

extension String {
    
    //    var localized: String {
    //        if let _ = UserDefaults.standard.string(forKey: "i18n_language") {} else {
    //            // we set a default, just in case
    //            UserDefaults.standard.set("base", forKey: "i18n_language")
    //            UserDefaults.standard.synchronize()
    //        }
    //
    //        let lang = UserDefaults.standard.string(forKey: "i18n_language")
    //
    //        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
    //        if let path = path {
    //            let bundle = Bundle(path: path)
    //            return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    //        }
    //
    //
    //    }
    
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
    
}
