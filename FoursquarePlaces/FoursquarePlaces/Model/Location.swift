//
//  Location.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import Foundation

struct Location: Codable {
    
    var address :String?
    var country : String?
    var cross_street : String?
    var formatted_address : String?
    var locality : String?
    var postcode : String?
    var region : String?
}
