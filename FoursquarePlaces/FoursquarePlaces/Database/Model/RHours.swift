//
//  RHours.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/4/22.
//

import Foundation
import RealmSwift

class RHours: Object {
    @objc dynamic var display : String? = nil
    @objc dynamic var is_local_holiday: Bool = false
    @objc dynamic var open_now : Bool = false
}


