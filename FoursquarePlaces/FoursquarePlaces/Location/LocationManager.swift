//
//  LocationManager.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/3/22.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
    
    static var shared = LocationManager()
    private var locationManager: CLLocationManager
    
    override init() {
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        super.init()
        locationManager.delegate = self
    }
    
    func start() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation() 
    }
   
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
         
        if manager.authorizationStatus == .authorizedWhenInUse ||
            manager.authorizationStatus == .authorizedAlways {
            
            locationManager.startUpdatingLocation()
        
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else {return}
        print(locValue.latitude)
        let lat = Double(locValue.latitude)
        let long = Double(locValue.longitude)
        let coordinate = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)
        let previousCoordinate = CLLocation(latitude: CLLocationDegrees(store.state.locationState.userLat), longitude: CLLocationDegrees(store.state.locationState.userLong))
        let distance = coordinate.distance(from: previousCoordinate)
        if store.state.locationState.userLat != 0{
            if distance >= 100 {
        store.dispatch(action: LocationActions.SetLocation(userLat: lat,userLong: long))
            }
        }else{
            store.dispatch(action: LocationActions.SetLocation(userLat: lat,userLong: long))
        }
    }
    
}


