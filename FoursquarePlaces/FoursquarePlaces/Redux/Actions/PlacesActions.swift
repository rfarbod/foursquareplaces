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
            
        }
        
        
    }
    
    
    struct SetPlaces: Action {
        let response: PlacesResult
    }
}
