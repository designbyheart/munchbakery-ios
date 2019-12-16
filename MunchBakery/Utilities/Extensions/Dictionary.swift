//
//  Dictionary.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 8/25/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation

extension Dictionary {
    
    var queryString: String {
        var output: String = ""
        for (key, value) in self {
            output +=  "\(key)=\(value)&"
        }
        output = String(output.dropLast())
        return output
    }
    
    mutating func unionInPlace(
        _ dictionary: Dictionary<Key, Value>) {
        for (key, value) in dictionary {
            self[key] = value
        }
    }
    
    mutating func merge(dict: [Key: Value]) {
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
    
    var toQueryString: String? {
        return self.reduce("") { "\($0!)\($1.0)=\($1.1)&" }
    }
    
}

extension Dictionary: URLQueryParameterStringConvertible {
    
    /**
     This computed property returns a query parameters string from the given NSDictionary. For
     example, if the input is @{@"day":@"Tuesday", @"month":@"January"}, the output
     string will be @"day=Tuesday&month=January".
     @return The computed parameters string.
     */
    var queryParameters: String {
        var parts: [String] = []
        for (key, value) in self {
            let part = String(format: "%@=%@",
                              String(describing: key).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
                              String(describing: value).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
            parts.append(part as String)
        }
        return parts.joined(separator: "&")
    }
    
}
