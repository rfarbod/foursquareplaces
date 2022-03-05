//
//  UserDefaultsManager.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/6/22.
//

import Foundation
import CoreLocation

extension UserDefaults{
    
    func setLocation(latitude: Double, long: Double) {
        set(latitude, forKey: UserDefaultsKeys.Latitude.rawValue)
    }

    func getLocation() -> (Double,Double){
        let latitude = double(forKey: UserDefaultsKeys.Latitude.rawValue)
        let longitude = double(forKey: UserDefaultsKeys.Longitude.rawValue)
        return (latitude,longitude)
    }
}

enum UserDefaultsKeys: String {
    case Latitude
    case Longitude
}
