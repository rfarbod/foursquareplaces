//
//  Geocodes.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import Foundation
import Unrealm



struct Geocode: Codable,Realmable {
    
    var main : MainGeocode?
    
}

struct MainGeocode: Codable,Realmable {
    var latitude : Double?
    var longitude : Double?

}

