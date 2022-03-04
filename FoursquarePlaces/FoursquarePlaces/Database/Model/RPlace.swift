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
    
    @objc dynamic var id : String? = nil
    var categories : [RCategories]? = nil
    @objc dynamic var distance : Double = 0
    var geocodes : RGeocode? = nil
    var location : RLocation? = nil
    @objc dynamic var name : String? = nil
    @objc dynamic var timezone : String? = nil
    var hours : RHours? = nil
    var photos: [RPhoto]? = nil
    var social_media : RSocialMedia? = nil
    @objc dynamic var verified :Bool = false
    
    override class func primaryKey() -> String? {
        return  "id"
    }
}
