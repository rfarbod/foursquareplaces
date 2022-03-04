//
//  Photo.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/3/22.
//

import Foundation

struct Photo: Codable {
    
    let created_at : String?
    let prefix : String?
    let suffix: String?
    let width: Double?
    let height: Double?
    let classifications: [String]?
}

extension Photo: Persistable {
    public init(managedObject: RPhoto) {
        created_at = managedObject.created_at ?? ""
        prefix = managedObject.prefix ?? ""
        suffix = managedObject.suffix ?? ""
        width = managedObject.width
        height = managedObject.height
        classifications = managedObject.classifications
    }
        public func managedObject() -> RPhoto {
            let photo = RPhoto()
            photo.created_at = created_at
            photo.prefix = prefix
            photo.suffix = suffix
            photo.width = width ?? 0
            photo.height = height ?? 0
            photo.classifications = classifications 
            return photo
        }
}
