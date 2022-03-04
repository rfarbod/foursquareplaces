//
//  RGeocode.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/4/22.
//

import Foundation
import RealmSwift


class RGeocode: Object {
    
    dynamic var main = RMainGeocode()
}

class RMainGeocode: Object {
    dynamic var lattitud = Double()
    dynamic var longitude = Double()
}
