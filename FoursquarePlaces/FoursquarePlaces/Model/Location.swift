//
//  Location.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import Foundation

struct Location: Codable {
    
    let address :String?
    let country : String?
    let cross_street : String?
    let formatted_address : String?
    let locality : String?
    let postcode : String?
    let region : String?
}

extension Location: Persistable {
    
    public init(managedObject: RLocation) {
        address = managedObject.address
        country = managedObject.country
        cross_street = managedObject.cross_street
        formatted_address = managedObject.formatted_address
        locality = managedObject.locality
        postcode = managedObject.postcode
        region = managedObject.region
    }
    public func managedObject() -> RLocation {
       let location = RLocation()
        location.address = address ?? ""
        location.country = country ?? ""
        location.cross_street = cross_street ?? ""
        location.formatted_address = formatted_address ?? ""
        location.locality = locality ?? ""
        location.postcode = postcode ?? ""
        location.region = region ?? ""
        return location
    }
}
