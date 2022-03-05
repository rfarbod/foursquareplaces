//
//  NetworkManager.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/27/22.
//

import Foundation
import Alamofire

public protocol NetworkServiceProtocol: AnyObject {
    
    func execute<T:Codable> (_ urlRequest: URLRequestBuilder,
                             model: T.Type,
                             completion: @escaping (Result<T,AFError>,String) -> Void)
    
    var isReachable: Bool {get}
}

public extension NetworkServiceProtocol {
    
    func execute<T:Codable> (_ urlRequest: URLRequestBuilder,
                             model: T.Type,
                             completion: @escaping ((Result<T,AFError>,String) -> Void)) {
        AF.request(urlRequest).responseDecodable(of: T.self) { result in
            var nextPageCursor: String = ""
            if let headers = result.response?.headers {
                if let linkUnwrapped = headers.dictionary["Link"] {
                    var link = linkUnwrapped
                    link = link.slice(from: "<", to: ">") ?? ""
                    if let linkAsURL = URL(string: link) {
                        if let cursor = linkAsURL.valueOf("cursor") {
                            nextPageCursor = cursor
                        }
                    }
                }
            }
            if let value = result.value {
                completion(Result.success(value), nextPageCursor)
            }else if let error = result.error {
                completion(Result.failure(error), nextPageCursor)
            }
        }
    }
    
    var isReachable: Bool {
        get {NetworkReachability.shared.isNetworkAvailable()}
    }
    
}

public class NetworkService: NetworkServiceProtocol {
    
   
    
    public static let `default`: NetworkServiceProtocol = {
        var service = NetworkService()
        return service
    }()
}
