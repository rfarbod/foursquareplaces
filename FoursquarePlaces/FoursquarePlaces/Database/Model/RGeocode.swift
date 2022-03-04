//
//  RGeocode.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/4/22.
//

import Foundation
import RealmSwift


class RGeocode: Object {
    
    @objc dynamic var main : RMainGeocode? = nil
}

class RMainGeocode: Object {
    @objc dynamic var lattitud: Double = 0
    @objc dynamic var longitude: Double = 0
}
