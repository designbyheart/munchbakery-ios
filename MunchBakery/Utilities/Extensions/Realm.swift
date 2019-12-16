//
//  Realm.swift
//  LIQR
//
//  Created by Pedja Jevtic on 7/11/19.
//  Copyright © 2019 Noise Derived. All rights reserved.
//

import Foundation
import RealmSwift

extension Realm {
    public func safeWrite(_ block: (() throws -> Void)) throws {
        if isInWriteTransaction {
            try block()
        } else {
            try write(block)
        }
    }
}
