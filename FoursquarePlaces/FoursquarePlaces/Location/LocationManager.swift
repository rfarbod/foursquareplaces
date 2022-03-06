//
//  LocationManager.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/3/22.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject {
    
    static var shared = LocationManager()
    private var locationManager: CLLocationManager
    
    override init() {
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        super.init()
        locationManager.delegate = self
    }
    
    func start() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func stop(){
        locationManager.stopUpdatingLocation()
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
        // calculating user's location distance from the previous state location
        
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else {return}
        let lat = Double(locValue.latitude)
        let long = Double(locValue.longitude)
        let currentLocation = CLLocation(latitude: locValue.latitude,
                                         longitude: locValue.longitude)
        
        if let previous = getPreviousCoordinate() {
            let distance = currentLocation.distance(from: previous)
            if distance > 100 {
                DatabaseService.default.removeAll()
                store.state.placesState.places.removeAll()
                store.dispatch(action: LocationActions.SetLocation(userLat: lat,userLong: long))
            }
        }else{
            store.dispatch(action: LocationActions.SetLocation(userLat: lat,userLong: long))
        }
        

    }
    
    
    func getPreviousCoordinate() -> CLLocation? {
        var previousCoordinate: CLLocation?
        
        if store.state.locationState.userLat != 0 && store.state.locationState.userLong != 0 {
            previousCoordinate = CLLocation(latitude: CLLocationDegrees(store.state.locationState.userLat),
                                            longitude: CLLocationDegrees(store.state.locationState.userLong))
        }else{
            let (lat,long) = UserDefaults.standard.getLocation()
            previousCoordinate = CLLocation(latitude: lat, longitude: long)
        }
        
        if previousCoordinate?.coordinate.latitude == 0 || previousCoordinate?.coordinate.longitude == 0 {
            return nil
        }
        
        return previousCoordinate
    }
}


