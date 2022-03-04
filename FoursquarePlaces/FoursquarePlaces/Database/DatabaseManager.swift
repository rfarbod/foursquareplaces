//
//  DatabaseManager.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/4/22.
//

import Foundation
import Realm
import RealmSwift
import SwiftUI

public protocol DatabaseServiceProtocol: AnyObject {
    func addToDatabase <T:Persistable> (_ value: T)
    func addBatchItemsToDatabase <T:Persistable> (_ values: [T])
}
public extension DatabaseServiceProtocol {
    
    func addToDatabase<T>(_ value: T) where T : Persistable {
        
        let container = try! Container()
        try! container.write({ transaction in
            transaction.add(value, update: .modified)
        })
    }
    
    
    func addBatchItemsToDatabase<T>(_ values: [T]) where T : Persistable {
         let container = try! Container()
        for each in values {
            try! container.write({ transaction in
                transaction.add(each, update: .modified)
            })
        }
    }
    
}
public class DatabaseService: DatabaseServiceProtocol {

    public static let `default`: DatabaseServiceProtocol = {
        var service = DatabaseService()
        return service
    }()
}
    

private final class WriteTransaction {
    private let realm: Realm
    internal init(realm: Realm) {
        self.realm = realm
    }
    public func add<T: Persistable>(_ value: T, update: Realm.UpdatePolicy) {
        realm.add(value.managedObject(), update: update)
    }
}

private final class Container {
    private let realm: Realm
    public convenience init() throws {
        try self.init(realm: Realm())
    }
    internal init(realm: Realm) {
        self.realm = realm
    }
    public func write(_ block: (WriteTransaction) throws -> Void)
    throws {
        let transaction = WriteTransaction(realm: realm)
        try realm.write {
            try block(transaction)
        }
    }
}
