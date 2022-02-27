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
            NetworkService.default.execute(Endpoints.getPlaces(35.765833, 51.4257523).resolve(), model: PlacesResult.self) { result in
                switch result {
                case let .success(response):
                    dispatch(SetPlaces(response: response))
                case let .failure(error):
                    print(error)
                }
            }
        }
        
        
    }
    
    
    struct SetPlaces: Action {
        let response: PlacesResult
    }
}
