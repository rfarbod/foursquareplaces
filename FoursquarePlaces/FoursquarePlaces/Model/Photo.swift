//
//  Photo.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/3/22.
//

import Foundation
import Unrealm

struct Photo: Codable,Realmable {
    
    var created_at : String?
    var prefix : String?
    var suffix: String?
    var width: Double?
    var height: Double?
    var classifications: [String]?
}


