//
//  Geocodes.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import Foundation



struct Geocode: Codable {
    
    let main : MainGeocode?
    
}

struct MainGeocode: Codable {
    let latitude : Double
    let longitude : Double

}

extension MainGeocode: Persistable{
    public init(managedObject: RMainGeocode) {
        latitude = managedObject.lattitud
        longitude = managedObject.longitude
    }
    public func managedObject() -> RMainGeocode {
        let main = RMainGeocode()
        main.lattitud = latitude
        main.longitude = longitude
        return main
    }
}
extension Geocode: Persistable {
    
    public init(managedObject: RGeocode) {
        if let managed = managedObject.main {
        main = MainGeocode(managedObject: managed)
        }else{
            main = nil
        }
    }
    public func managedObject() -> RGeocode {
       let geocode = RGeocode()
        if let main = main {
            geocode.main = main.managedObject()
        }
        return geocode
    }
}
