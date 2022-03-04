//
//  PlacesActions.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import Foundation
import SwiftUIFlux

struct PlacesActions {
    
    struct GetPlaces: AsyncAction {
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            var urlReuqest:URLRequestBuilder
            guard let state = state as? AppState else {
                return
            }
            urlReuqest = Endpoints.getPlaces(
                state.locationState.userLat,
                state.locationState.userLong,
                state.placesState.nextPageCursorState,
                state.placesState.currentRadiusState)
                .resolve()
            
            NetworkService.default.execute(urlReuqest, model: PlacesResult.self) { result,cursor  in
                switch result {
                case let .success(response):
                    var actionPlaces = response.results
                    
                    for each in actionPlaces {
                        if state.placesState.places.contains(where: { place in
                        
                            return place == each
                        }){
                            actionPlaces.removeAll { place in
                                return place == each
                            }
                        }
                    }
                    
                    if actionPlaces.isEmpty {
                        dispatch(SetNewRadius(radius: store.state.placesState.currentRadiusState + 1000))
                        dispatch(SetNextPageCursor(nextPageCursor: cursor))
                        dispatch(GetPlaces())
                    }else{
                        let placesResult = PlacesResult(results: actionPlaces)
                        dispatch(SetPlaces(response: placesResult, nextPageCursor: cursor))
                    }
                case let .failure(error):
                    print(error)
                }
            }
        }
    }

    struct GetPlaceDetails: AsyncAction {
        
        func execute(state: FluxState?, dispatch: @escaping DispatchFunction) {
            
            guard let id = store.state.placesState.selectedPlace.id else {return}
            let urlRequest = Endpoints.getPlaceDetails(id).resolve()
        
            
            NetworkService.default.execute(urlRequest, model: Place.self) { result, cursor in
                switch result {
                case let .success(place):
                    guard let hours = place.hours else{return}
                    guard let social_media = place.social_media else{return}
                    store.dispatch(action: PlacesActions.SetPlaceDetail(id: place.id ?? "" , hours: hours, socialMedia: social_media))
                case let .failure(error):
                    print(error)
                }
            }
        }
        
        
    }

    struct SetPlaceDetail:Action {
        let id : String
        let hours: Hours
        let socialMedia: SocialMedia
    }
    
    struct SelectPlace: Action {
        let place: Place
    }
    
    struct SetPlaces: Action {
        let response: PlacesResult
        let nextPageCursor: String
    }
    
    struct SetNextPageCursor: Action {
        let nextPageCursor: String
    }
    
    struct SetNewRadius: Action {
        let radius: Int
    }
}
