//
//  FoursquarePlacesApp.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import SwiftUI
import SwiftUIFlux
import Unrealm
@main
struct FoursquarePlacesApp: App {
    
    @UIApplicationDelegateAdaptor(MyAppDelagate.self) private var appDelegate

    var body: some Scene {
        
        WindowGroup {
            StoreProvider(store: store, content: {
                HomeView()
            })
            
        }
    }
}
