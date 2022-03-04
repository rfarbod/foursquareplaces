//
//  Hours.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/3/22.
//

import Foundation

struct Hours: Codable {
    
    let display: String?
    let is_local_holiday: Bool?
    let open_now: Bool?
    
}

extension Hours: Persistable {

    public init(managedObject: RHours) {
        display = managedObject.display
        is_local_holiday = managedObject.is_local_holiday
        open_now = managedObject.open_now
    }
        public func managedObject() -> RHours {
            let hours = RHours()
            hours.display = display
            hours.open_now = open_now ?? false
            hours.is_local_holiday = is_local_holiday ?? false
            return hours
        }

}
            
