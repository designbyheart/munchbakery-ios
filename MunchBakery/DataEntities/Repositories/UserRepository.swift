//
//  UserRepository.swift
//  MunchBakery
//
//  Created by Predrag Jevtic on 11/28/19.
//  Copyright © 2019 Predrag Jevtic. All rights reserved.
//

import Foundation

struct UserRepository {
    
    func currentUser() -> UserEntity? {
        let users = RealmService.shared.load(UserEntity.self) as? [UserEntity] ?? []
        if users.count > 0 {
            return users.first
        }
        return nil
    }
    
    func submitLogin(_ email: String? = nil, _ password: String? = nil, completion: @escaping (String?, String?) -> Void) {
        guard
            let email = email,
            email.isValidEmail(),
            let password = password,
            password.count > 5
            else {
                completion(nil, "Credentials are invalid")
                return
        }
        
        ((try? RealmService.shared.realm?.safeWrite {
            let user = UserEntity()
            user.email = email
        }) as ()??)
    }
    
}
