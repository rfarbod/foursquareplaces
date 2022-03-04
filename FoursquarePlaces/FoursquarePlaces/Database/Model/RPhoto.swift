//
//  RPhoto.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/4/22.
//

import Foundation
import RealmSwift

class RPhoto: Object {
    dynamic var created_at = String()
    dynamic var prefix = String()
    dynamic var suffix = String()
    dynamic var width =  Double()
    dynamic var height = Double()
    dynamic var classifications: [String]? = nil 
}
