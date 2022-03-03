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
            if  store.state.placesState.nextPageCursorState.isEmpty {
                urlReuqest = Endpoints.getPlaces(35.765833, 51.4257523).resolve()
            }else{
                urlReuqest = Endpoints.getPlaces(35.765833, 51.4257523, store.state.placesState.nextPageCursorState).resolve()
            }
            NetworkService.default.execute(urlReuqest, model: PlacesResult.self) { result,cursor  in
                
                switch result {
                case let .success(response):
                    dispatch(SetPlaces(response: response, nextPageCursor: cursor))
                case let .failure(error):
                    print(error)
                }
            }
        }
        
        
    }
    
    
    struct SetPlaces: Action {
        let response: PlacesResult
        let nextPageCursor: String
    }
}
