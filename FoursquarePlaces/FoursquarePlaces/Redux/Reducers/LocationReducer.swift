//
//  LocationReducer.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/4/22.
//

import Foundation
import SwiftUIFlux

func locationReducer(state: UserLocationState, action: Action) -> UserLocationState {
    var state = state
    switch action {
    case let action as LocationActions.SetLocation:
        state.userLat = action.userLat
        state.userLong = action.userLong
        UserDefaults.standard.setLocation(latitude: action.userLat, long: action.userLong)
    default:
        break
    }
    return state 
}
