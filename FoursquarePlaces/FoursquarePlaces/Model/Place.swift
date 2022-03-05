//
//  Place.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import Foundation
import Unrealm

struct PlacesResult: Codable {
    
    let results : [Place]
}
struct Place: Codable,Identifiable,Equatable,Realmable {
    
    var id : String = ""
    var distance : Double?
    var geocodes : Geocode?
    var location : Location?
    var name : String?
    var timezone : String?
    var hours: Hours?
    var photos: [Photo]?
    var social_media: SocialMedia? = nil
    var verified: Bool?
    var price: Int?
    var tips: [Tips]?
    
    private enum CodingKeys : String, CodingKey {
           case id = "fsq_id"
           case distance
           case geocodes
           case location
           case name
           case timezone
           case hours
           case photos
           case social_media
           case verified
           case price
       }
    
    static func == (lhs: Place, rhs: Place) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func primaryKey() -> String? {
        return "id"
    }
    
    
}

