//
//  RLocation.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/4/22.
//

import Foundation
import RealmSwift

class RLocation: Object {
    
    @objc dynamic var address : String?
    @objc dynamic var country : String?
    @objc dynamic var cross_street : String?
    @objc dynamic var formatted_address : String?
    @objc dynamic var locality : String?
    @objc dynamic var postcode : String?
    @objc dynamic var region   : String?
}
