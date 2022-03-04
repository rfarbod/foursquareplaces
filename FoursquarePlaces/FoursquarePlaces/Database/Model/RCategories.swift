//
//  RCategories.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/4/22.
//

import Foundation
import RealmSwift

class  RCategories: Object {
    
    @objc dynamic var id : Int = 0
    @objc dynamic var name : String? = nil
    var icon : RIcon? = nil
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
