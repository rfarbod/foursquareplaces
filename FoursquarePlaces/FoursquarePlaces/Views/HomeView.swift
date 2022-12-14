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
    @State var navigate = false
    
    var places: [Place] {
        return store.state.placesState.places
    }
    
    var userLat: Double {
        return store.state.locationState.userLat
    }
    
    var userLong:Double {
        return store.state.locationState.userLong
    }
    
    
    var body: some View {
        NavigationView {
            ZStack {
                if !places.isEmpty {
                    List {
                        ForEach(places) { place in
                            ZStack{
                                
                                NavigationLink(destination: PlaceDetailView(), isActive: $navigate) {
                                    EmptyView()
                                }
                                .hidden()
                                
                                PlaceView(place: place)
                                    .onAppear {
                                        //getting ready to fetch new places when user is close to the bottom of the list
                                        if place == self.places.last && store.state.isOfflineState == false{
                                            store.dispatch(action: PlacesActions.GetPlaces())
                                        }
                                    }
                                    .onTapGesture {
                                        store.dispatch(action: PlacesActions.SelectPlace(place: place))
                                        navigate = true
                                    }
                                    .background(.clear)
                            }
                        }
                    }
                    .background(.clear)
                    .animation(.default, value: places.count)
                    .listRowSeparator(.hidden)
                }
            }
            .navigationTitle("Nearby Places")
        }
        .onChange(of: userLat, perform: { newValue in
            store.dispatch(action: PlacesActions.GetPlaces())
        })
        .onAppear {
            if userLat.isZero {
                LocationManager.shared.start()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
