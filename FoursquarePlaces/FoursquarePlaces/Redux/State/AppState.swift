//
//  AppState.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import Foundation
import SwiftUIFlux

struct AppState: FluxState {
    
    var placesState = PlacesState()
    var nextPageCursorState = String()
}
