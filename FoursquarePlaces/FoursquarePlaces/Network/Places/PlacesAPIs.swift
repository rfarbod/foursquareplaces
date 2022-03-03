//
//  PlacesAPIs.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/27/22.
//

import Foundation
import Alamofire

enum PlacesAPIs: URLRequestBuilder {
    
    case getPlaces(Double,Double,String = "",Int)
    
}

extension PlacesAPIs {
    var path: String {
        switch self {
        case .getPlaces:
            return Path.Places.getPlaces
        }
    }
}

extension PlacesAPIs {
    var parameters: Parameters? {
        switch self {
        case .getPlaces(let lattitude, let longitude, let cursor, let radius):
            return ["ll":"\(lattitude),\(longitude)","limit": 10,"radius": radius, "cursor": cursor, "sort": "DISTANCE"]
        }
    }
}

extension PlacesAPIs {
    var method: HTTPMethod {
        switch self {
        case .getPlaces:
            return .get
        }
    }
}

extension PlacesAPIs {
    var headers: HTTPHeaders {
        switch self {
        case .getPlaces:
            return ["Authorization": "\(Keys.foursquare)"]
        }
    }
}
