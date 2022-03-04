//
//  Icon.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import Foundation

struct Icon: Codable {
    
    let prefix : String
    let suffix : String
}

extension Icon: Persistable {
   
    public init(managedObject: RIcon) {
        suffix = managedObject.suffix
        prefix = managedObject.prefix
    }
    public func managedObject() -> RIcon {
        let icon = RIcon()
        icon.suffix = suffix
        icon.prefix = prefix
        return icon
    }
    
    
}
