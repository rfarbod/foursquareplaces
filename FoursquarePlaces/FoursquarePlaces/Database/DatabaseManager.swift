//
//  DatabaseManager.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/4/22.
//

import Foundation
import Unrealm
import SwiftUI

public protocol DatabaseServiceProtocol: AnyObject {
    func addToDatabase <T:Realmable> (_ value: T)
    func addBatchItemsToDatabase <T:Realmable> (_ values: [T])
    func fetchItems<T:Realmable> (_ type: T.Type) -> [T]
    
}
public extension DatabaseServiceProtocol {
    
    func addToDatabase<T>(_ value: T) where T : Realmable {
        
       let realm = try! Realm()
        try! realm.write({
            realm.add(value)
        })
    }
    
    
    func addBatchItemsToDatabase<T>(_ values: [T]) where T : Realmable {
        let realm = try! Realm()
        for each in values {
            try! realm.write({
                realm.add(each)
            })
        }
        }
    
     func fetchItems<T>(_ type: T.Type) -> [T] where T : Realmable {
         
         let realm = try! Realm()
         let results = Array(realm.objects(T.self))
         return results
    }
    
    
    
  
    
}
public class DatabaseService: DatabaseServiceProtocol {
   
    public static let `default`: DatabaseServiceProtocol = {
        var service = DatabaseService()
        return service
    }()
}
    
