//
//  PlacesState.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import Foundation
import SwiftUIFlux

struct PlacesState: FluxState {
    
    var places = [Place]()
    var nextPageCursorState = String()
}

