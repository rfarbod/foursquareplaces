//
//  Place.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import Foundation

struct PlacesResult: Codable {
    
    var results = [Place]()
}
struct Place: Codable,Identifiable,Equatable {
    var id = String()
    var categories = [Categories]()
    var distance = Double()
    var geocodes = Geocode()
    var location = Location()
    var name = String()
    var timezone = String()
    
    private enum CodingKeys : String, CodingKey {
           case id = "fsq_id"
           case categories
           case distance
           case geocodes
           case location
           case name
           case timezone
       }
    
    static func == (lhs: Place, rhs: Place) -> Bool {
        return lhs.id == rhs.id
    }
    
    
}
