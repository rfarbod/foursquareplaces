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
        state.places += action.response.results
        if !action.nextPageCursor.isEmpty {
            state.nextPageCursorState = action.nextPageCursor
        }else{
            state.nextPageCursorState.removeAll()
            state.currentRadiusState += 1000
        }
    case let action as PlacesActions.SetNewRadius:
        state.currentRadiusState = action.radius
    case let action as PlacesActions.SetNextPageCursor:
        state.nextPageCursorState = action.nextPageCursor
    default:
        break
    }
    return state
}


