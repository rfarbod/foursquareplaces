//
//  RPlace.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/4/22.
//

import Foundation
import Realm
import RealmSwift


class RPlace: Object {
    
    dynamic var id = String()
    dynamic var categories : [RCategories]? = nil
    dynamic var distance = Double()
    dynamic var geocodes = RGeocode()
    dynamic var location = RLocation()
    dynamic var name = String()
    dynamic var timezone = String()
    dynamic var hours : RHours? = nil
    dynamic var photos: [RPhoto]? = nil
    dynamic var social_media : RSocialMedia? = nil
    dynamic var verified = false
}
