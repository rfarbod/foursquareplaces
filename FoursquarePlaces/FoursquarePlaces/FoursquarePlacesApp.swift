//
//  FoursquarePlacesApp.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import SwiftUI
import SwiftUIFlux

@main
struct FoursquarePlacesApp: App {
    var body: some Scene {
        WindowGroup {
            StoreProvider(store: store, content: {
                HomeView()
            })
        }
    }
}
