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
        state.places += action.response
        if !action.nextPageCursor.isEmpty {
            state.nextPageCursorState = action.nextPageCursor
        }else{
            state.nextPageCursorState.removeAll()
            state.currentRadiusState += 1000
        }
        if !action.response.isEmpty {
            let places = DatabaseService.default.fetchItems(Place.self)
            var actionPlaces = action.response
            actionPlaces.removeAll { actionPlace in
                return places.contains { place in
                    return actionPlace.id == place.id
                }
            }
        DatabaseService.default.addBatchItemsToDatabase(actionPlaces)
        }
    case let action as PlacesActions.SetPlacesFromDatabase:
        state.places = action.places
    case let action as PlacesActions.SetNewRadius:
        state.currentRadiusState = action.radius
    case let action as PlacesActions.SetNextPageCursor:
        state.nextPageCursorState = action.nextPageCursor
    case let action as PlacesActions.SelectPlace:
        state.selectedPlace = action.place
    case let action as PlacesActions.SetPlaceDetail:
        if let placeIndex = store.state.placesState.places.firstIndex(where: { place in
            return place.id == action.id
        }){
            if store.state.placesState.places.indices.contains(placeIndex) {
                store.state.placesState.places[placeIndex].hours = action.hours
                store.state.placesState.places[placeIndex].social_media = action.socialMedia
            }
        }
    default:
        break
    }
    return state
}


