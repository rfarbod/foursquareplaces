//
//  AppState.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import Foundation
import SwiftUIFlux

struct AppState: FluxState {
    var isOfflineState = Bool()
    var placesState = PlacesState()
    var locationState = UserLocationState()
    
}
