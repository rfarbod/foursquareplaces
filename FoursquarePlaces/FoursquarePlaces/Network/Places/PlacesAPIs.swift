//
//  PlacesAPIs.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/27/22.
//

import Foundation
import Alamofire

enum PlaceFields: String {
    case fsq_id = "fsq_id"
    case categories = "categories"
    case name = "name"
    case geocodes = "geocodes"
    case location = "location"
    case timezone = "timezone"
    case distance = "distance"
    case photos   = "photos"
}
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
            let fields: String =
            "\(PlaceFields.fsq_id.rawValue),\(PlaceFields.categories.rawValue),\(PlaceFields.name.rawValue),\(PlaceFields.geocodes.rawValue),\(PlaceFields.location.rawValue),\(PlaceFields.timezone.rawValue),\(PlaceFields.distance.rawValue),\(PlaceFields.photos.rawValue)"
            return ["ll":"\(lattitude),\(longitude)","limit": 10,"radius": radius, "cursor": cursor, "sort": "DISTANCE","fields": fields]
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
