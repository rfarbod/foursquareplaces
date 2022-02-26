//
//  Geocodes.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import Foundation



struct Geocode: Codable {
    
    var main = MainGeocode()
    
}

struct MainGeocode: Codable {
    var latitude = Double()
    var longitude = Double()

}
