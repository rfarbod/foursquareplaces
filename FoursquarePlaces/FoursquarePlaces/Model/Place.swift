//
//  Place.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import Foundation


struct Place: Codable {
    
    var fsqId = String()
    var categories = [Categories]()
    var distance = Double()
    var geocodes = [Geocode]()
    var location = Location()
    var name = String()
    var timezone = String()
    
}
