//
//  ContentView.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import SwiftUI
import SwiftUIFlux

struct HomeView: View {
    
    @EnvironmentObject var store : Store<AppState>
    
    var places:[Place] {
        return store.state.placesState.places
    }
    
    var body: some View {
        NavigationView {
            if !places.isEmpty {
                VStack {
                ForEach(places) { place in
                    Text(place.name)
                }
                }
            }
        }.onAppear {
            store.dispatch(action: PlacesActions.GetPlaces())
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
