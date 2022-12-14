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
    case hours = "hours"
    case social_media = "social_media"
    case price = "price"
}
enum PlacesAPIs: URLRequestBuilder {
    
    case getPlaces(Double,Double,String = "",Int)
    case getPlaceDetails(String)
    case getPlaceTips(String)
    
}

extension PlacesAPIs {
    var path: String {
        switch self {
        case .getPlaces:
            return Path.Places.getPlaces
        case .getPlaceDetails(let fsqId):
            return "\(Path.Places.getPlaceDetails)\(fsqId)"
        case .getPlaceTips(let fsqId):
            return Path.Places.getPlaceTips(fsqId: fsqId)
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
        case .getPlaceDetails(_):
            let fields: String =
            "\(PlaceFields.fsq_id.rawValue),\(PlaceFields.hours.rawValue),\(PlaceFields.social_media.rawValue),\(PlaceFields.price.rawValue)"
            return ["fields":fields]
        case .getPlaceTips(_):
            return nil
        }
    }
}

extension PlacesAPIs {
    var method: HTTPMethod {
        switch self {
        case .getPlaces,.getPlaceDetails,.getPlaceTips:
            return .get
        }
    }
}

extension PlacesAPIs {
    var headers: HTTPHeaders {
        switch self {
        case .getPlaces,.getPlaceDetails,.getPlaceTips:
            return ["Authorization": "\(Keys.foursquare)"]
        }
    }
}
