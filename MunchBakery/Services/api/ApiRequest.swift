//
//  ApiRequest.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 8/25/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation
import MobileCoreServices
import AVFoundation

protocol ApiRequest {
    var baseURL: BaseURL { get }
    var path: APIPath { get }
    var method: APIMethod { get }
    var body: [String: Any] { get set }
    var urlParams: [String: Any] { get set }
    var requiredAuth: Bool { get }
    var defaultHeader: Bool { get }
}


extension ApiRequest {
    
    var defaultHeader: Bool {
        return true
    }
    
    func defaultHeader(_ request: URLRequest) -> URLRequest {
        if !self.defaultHeader {
            return request
        }
        var request = request
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    func secureHeader(_ request: URLRequest) -> URLRequest {
        if !self.requiredAuth {
            return request
        }
        var request = request
        if let token = AuthManager.accessToken() {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        return request
    }
    
    func request() -> URLRequest? {
        guard var URL = URL(string: self.baseURL.rawValue + self.path.path) else {
            return nil
        }
        
        URL = URL.appendingQueryParameters(self.urlParams)
        var request = URLRequest(url: URL)
        request.httpMethod = self.method.rawValue
        
        // Headers
        request = defaultHeader(request)
        request = secureHeader(request)
        
        // Setup body
        
        if self.body.count > 0 {
            request.httpBody = try! JSONSerialization.data(withJSONObject: self.body, options: [])
        }
        
        return request
    }
    
    // MARK: - Setup body for uploading video files
    
    func tempURL() -> URL? {
        let directory = NSTemporaryDirectory() as NSString
        
        if directory != "" {
            let path = directory.appendingPathComponent(NSUUID().uuidString + ".mp4")
            return URL(fileURLWithPath: path)
        }
        
        return nil
    }
    
}

enum ApiRequestError: Error {
    case missingBaseURL
    case missingEnvironment
    case missingAuthenticationToken
}

enum ResponseError: Error {
    case invalidUserData
    case customMessage
}

enum ApiRequestResponseType {
    case json
    case dictionary
    case data
    case array
}
