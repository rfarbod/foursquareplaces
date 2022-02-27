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
            ZStack {
                Color(uiColor: .systemGray6)
                ScrollView {
                    if !places.isEmpty {
                        VStack() {
                            ForEach(places) { place in
                                PlaceView(name: place.name)
                            }
                            .background(.clear)
                            .padding([.leading, .trailing], 10)
                        }
                    }
                }
            }
            .navigationTitle("Nearby Places")
        }
        .onAppear {
            store.dispatch(action: PlacesActions.GetPlaces())
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
