//
//  Persistable.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/4/22.
//

import Foundation
import RealmSwift

public protocol Persistable {
    associatedtype ManagedObject: RealmSwift.Object
        init(managedObject: ManagedObject)
        func managedObject() -> ManagedObject
}
