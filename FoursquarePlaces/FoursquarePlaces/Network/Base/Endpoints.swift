//
//  Endpoints.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/27/22.
//

import Foundation

public enum Endpoints {
    case getPlaces(Double,Double,String = "",Int)
}

public extension Endpoints {
    
    func resolve() -> URLRequestBuilder {
        switch self {
        case .getPlaces(let lat, let long, let cursor, let radius):
            return PlacesAPIs.getPlaces(lat, long,cursor,radius)
        }
    }
}
