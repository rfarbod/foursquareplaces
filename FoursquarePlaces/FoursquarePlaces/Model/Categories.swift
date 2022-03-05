//
//  Categories.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import Foundation
import Unrealm

struct Categories: Codable,Realmable{
    
    var id : Int = 0
    var name : String?
    var icon : Icon?
    
    static func primaryKey() -> String? {
        return "id"
    }
    
    static var realmClassPrefix: String {
        return "RLM_S"
    }
}


