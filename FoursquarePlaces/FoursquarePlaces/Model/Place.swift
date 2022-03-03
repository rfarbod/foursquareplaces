//
//  Place.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import Foundation

struct PlacesResult: Codable {
    
    let results : [Place]
}
struct Place: Codable,Identifiable,Equatable {
    let id : String
    let categories : [Categories]?
    let distance : Double
    let geocodes : Geocode
    let location : Location
    let name : String
    let timezone : String
    let hours: Hours?
    let photos: [Photo]?
    let social_media: SocialMedia?
    let verified: Bool?
    
    private enum CodingKeys : String, CodingKey {
           case id = "fsq_id"
           case categories
           case distance
           case geocodes
           case location
           case name
           case timezone
           case hours
           case photos
           case social_media
           case verified
       }
    
    static func == (lhs: Place, rhs: Place) -> Bool {
        return lhs.id == rhs.id
    }
    
    
}
