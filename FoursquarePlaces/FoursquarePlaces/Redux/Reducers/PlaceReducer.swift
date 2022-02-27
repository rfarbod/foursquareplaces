//
//  MovieReducer.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import Foundation
import SwiftUIFlux

func placesStateReducer(state: PlacesState, action: Action) -> PlacesState {
    var state = state
    switch action {
    case let action as PlacesActions.SetPlaces:
        state.places = action.response.results
        for each in state.places {
            print(each.name)
        }
    default:
        break
    }
    return state
}
