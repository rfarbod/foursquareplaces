//
//  AppReducer.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import Foundation
import SwiftUIFlux

func appStateReducer(state: AppState, action: Action) -> AppState {
    var state = state
    state.placesState =  placesStateReducer(state: state.placesState, action: action)
    state.locationState = locationReducer(state: state.locationState, action: action)
    return state
}
