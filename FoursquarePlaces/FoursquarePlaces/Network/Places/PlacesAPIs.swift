//
//  PlacesAPIs.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/27/22.
//

import Foundation
import Alamofire

enum PlacesAPIs: URLRequestBuilder {
    
    case getPlaces(Double,Double,String = "")
    
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
        case .getPlaces(let lattitude, let longitude, let cursor):
            if cursor.isEmpty {
                return ["ll": "\(lattitude),\(longitude)","limit": 10]
            }else{
                return ["ll":"\(lattitude),\(longitude)","limit": 10, "cursor": cursor]
            }
          
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
