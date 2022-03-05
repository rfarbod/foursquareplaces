//
//  MapView.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/5/22.
//

import SwiftUI
import MapKit

struct MapView: View{

    struct PinItem: Identifiable {
        let id = UUID()
        let coordinate: CLLocationCoordinate2D
    }

    @State private var region: MKCoordinateRegion

    var latitude: Float
    var longitude: Float
    var markerArray: [PinItem]
    var center: CLLocationCoordinate2D

    init(latitude: Float, longitude: Float) {
        self.latitude = latitude
        self.longitude = longitude

        let latitude = CLLocationDegrees(latitude)
        let longitude = CLLocationDegrees(longitude)
        center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        markerArray = [PinItem(coordinate: center)]

        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        region = MKCoordinateRegion(center: center, span: span)
    }

    var body: some View {
        Map(coordinateRegion: $region,
            interactionModes: [],
            showsUserLocation: true,
            userTrackingMode: nil,
            annotationItems: markerArray) { item in
            MapMarker(coordinate: item.coordinate)

        }
    }


}

