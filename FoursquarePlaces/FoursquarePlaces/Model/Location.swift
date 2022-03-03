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
