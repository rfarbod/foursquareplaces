//
//  RPhoto.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/4/22.
//

import Foundation
import RealmSwift

class RPhoto: Object {
    @objc dynamic var created_at: String? = nil
    @objc dynamic var prefix : String? = nil
    @objc dynamic var suffix : String? = nil
    @objc dynamic var width : Double = 0
    @objc dynamic var height : Double = 0
    var classifications: [String]? = nil 
}
