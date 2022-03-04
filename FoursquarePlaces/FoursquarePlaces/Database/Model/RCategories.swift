//
//  RCategories.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/4/22.
//

import Foundation
import RealmSwift

class  RCategories: Object {
    
    dynamic var id = Int()
    dynamic var name  = String()
    dynamic var icon = RIcon()
}
