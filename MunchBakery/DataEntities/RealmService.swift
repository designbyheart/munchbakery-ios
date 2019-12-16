//
//  RealmService.swift
//  LIQR
//
//  Created by Pedja Jevtic on 7/8/19.
//  Copyright © 2019 Noise Derived. All rights reserved.
//
import Foundation
import Realm
import RealmSwift

class RealmService {
    
    static let shared = RealmService()
    static let version: UInt64 = 47
    
    init() {
        let config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema version before, the version is 0).
            schemaVersion: RealmService.version,
            
            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { migration, oldSchemaVersion in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
//                if (oldSchemaVersion < RealmService.version) {
//                    if oldSchemaVersion < 1 {
//                        
//                    }
//                    // Nothing to do!
//                    // Realm will automatically detect new properties and removed properties
//                    // And will update the schema on disk automatically
//                }
        })
        
        // Tell Realm to use this new configuration object for the default Realm
        Realm.Configuration.defaultConfiguration = config
        
        // Now that we've told Realm how to handle the schema change, opening the file
        // will automatically perform the migration
        initRealm()
    }
    
    func initRealm() {
        do {
            self.realm = try Realm()
        }
        catch {
            print(error)
        }
    }
    
    var realm: Realm?
    let config = Realm.Configuration(
        // Set the new schema version. This must be greater than the previously used
        // version (if you've never set a schema version before, the version is 0).
        //        fileURL: Bundle.main.url(forResource: "RealmData", withExtension: "realm"),
        readOnly: false,
        schemaVersion: RealmService.version,
        // Set the block which will be called automatically when opening a Realm with
        // a schema version lower than the one set above
        migrationBlock: { migration, oldSchemaVersion in
            
            if oldSchemaVersion < RealmService.version {
                //                migration.deleteData(forType: ChatGroup.className())
            }
    }
    )
    
    func store(_ object: Object) {
        if self.realm == nil {
            self.initRealm()
        }
        
        guard let realm = self.realm else {
            print("missing initialized realm")
            return
        }
        
        do {
            
            try realm.safeWrite {
                realm.add(object, update: .modified)
            }
            //            try realm.commitWrite()
        }
        catch {
            print(error)
        }
    }
    
    func load<T: Object>(_ objectType: T.Type, query: String? = nil) -> [Object] {
        if self.realm == nil {
            self.initRealm()
        }
        
        guard let realm = self.realm else {
            print("missing initialized realm")
            return []
        }
        
        if let query = query {
            let results = realm.objects(T.self).filter(query)
            return results.map({ $0 })
        }
        
        let results = realm.objects(T.self)
        return results.map({ $0 })
    }
    
    func loadSingle<T: Object>(_ objectType: T.Type, query: String? = nil) -> Object? {
        if self.realm == nil {
            self.initRealm()
        }
        
        guard let realm = self.realm else {
            print("missing initialized realm")
            return nil
        }
        
        if let query = query {
            let results = realm.objects(T.self).filter(query)
            return results.first
        }
        
        let results = realm.objects(T.self)
        return results.first
    }
    
    func delete(_ object: Object) {
        if self.realm == nil {
            self.initRealm()
        }
        
        guard let realm = self.realm else {
            print("missing initialized realm")
            return
        }
        
        do {
            try realm.safeWrite {
                realm.delete(object)
            }
        }
        catch {
            print(error)
        }
    }
    
    func deleteAll(_ objects: [Object]) {
        if self.realm == nil {
            self.initRealm()
        }
        
        guard let realm = self.realm else {
            print("missing initialized realm")
            return
        }
        
        do {
            try realm.safeWrite {
                realm.delete(objects)
            }
        }
        catch {
            print(error)
        }
    }
    
}
