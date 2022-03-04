//
//  Categories.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import Foundation

struct Categories: Codable {
    
    let id : Int
    let name : String
    let icon : Icon
    
}

extension Categories: Persistable {
    public init(managedObject: RCategories) {
        id = managedObject.id
        name = managedObject.name
        icon = Icon(managedObject: managedObject.icon)
    }
    public func managedObject() -> RCategories {
        let category = RCategories()
        category.id = id
        category.name = name
        category.icon = icon.managedObject()
        return category
    }
    
    
}

