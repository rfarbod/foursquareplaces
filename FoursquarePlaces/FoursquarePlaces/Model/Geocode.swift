//
//  Geocodes.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import Foundation



struct Geocode: Codable {
    
    let main : MainGeocode
    
}

struct MainGeocode: Codable {
    let latitude : Double
    let longitude : Double

}
