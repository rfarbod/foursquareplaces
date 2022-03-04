//
//  RLocation.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/4/22.
//

import Foundation
import RealmSwift

class RLocation: Object {
    
    dynamic var address = String()
    dynamic var country = String()
    dynamic var cross_street = String()
    dynamic var formatted_address = String()
    dynamic var locality = String()
    dynamic var postcode = String()
    dynamic var region = String()
}
