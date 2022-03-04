//
//  RHours.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/4/22.
//

import Foundation
import RealmSwift

class RHours: Object {
    dynamic var display = String()
    dynamic var is_local_holiday = Bool()
    dynamic var open_now = Bool()
}


