//
//  LocationActions.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/4/22.
//

import Foundation
import SwiftUIFlux

struct LocationActions {
    
    struct SetLocation: Action {
        let userLat: Double
        let userLong: Double
    }
}
