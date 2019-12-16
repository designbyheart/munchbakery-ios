//
//  URL.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 8/25/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation

extension URL {

    func appendingQueryParameters(_ parametersDictionary: Dictionary<String, String>) -> URL {
        let URLString: String = String(format: "%@?%@", self.absoluteString, parametersDictionary.queryParameters)
        return URL(string: URLString)!
    }
    
    func appendingQueryParameters(_ parametersDictionary: Dictionary<String, Any>) -> URL {
        let URLString = self.appendingQueryItems(parametersDictionary)
        return URL(string: URLString)!
    }
    
    
    func appendingQueryItems(_ contentsOf: [String: Any?]) -> String {
        guard var urlComponents = URLComponents(string: absoluteString), !contentsOf.isEmpty else {
            return absoluteString
        }
        
        let keys = contentsOf.keys.map { $0.lowercased() }
        
        urlComponents.queryItems = urlComponents.queryItems?
            .filter { !keys.contains($0.name.lowercased()) } ?? []
        
        urlComponents.queryItems?.append(contentsOf: contentsOf.compactMap {
            if let value = $0.value as? String {
                return URLQueryItem(name: $0.key, value: value)
            }
            
            if let valueObj = $0.value as? [String: Any] {
                for (key, value) in valueObj {
                    print(key, value, $0.key)
                    //                    URLQueryItem(name: $0.key + key, value: valueObj.queryString)
                }
            }
            
            return nil
        })
        
        return urlComponents.string ?? ""
    }
    
    subscript(queryParam: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        if let parameters = url.queryItems {
            return parameters.first(where: { $0.name == queryParam })?.value
        } else if let paramPairs = url.fragment?.components(separatedBy: "?").last?.components(separatedBy: "&") {
            for pair in paramPairs where pair.contains(queryParam) {
                return pair.components(separatedBy: "=").last
            }
            return nil
        } else {
            return nil
        }
    }

}
