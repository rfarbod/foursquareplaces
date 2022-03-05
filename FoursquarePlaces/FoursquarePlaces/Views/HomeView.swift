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
                            HStack {
                            PlaceView(place: place)
                                .onAppear {
                                    //getting ready to fetch new places when user is close to the bottom of the list
                                    if place == self.places.last {
                                        store.dispatch(action: PlacesActions.GetPlaces())
                                    }
                                }
                                .onTapGesture {
                                    store.dispatch(action: PlacesActions.SelectPlace(place: place))
                                    store.dispatch(action: PlacesActions.GetPlaceDetails())
                                }
                                .background(.clear)
                            NavigationLink("", destination: PlaceDetailView(place: place, tips: [1,3,4,5,6]))
                                    .frame(width: 50, height: 80)
                            }
                        .background(.clear)
                        .padding([.leading, .trailing], 10)
                        .listRowSeparator(.hidden)
                       
                        
                    }
                    }
                    .background(.clear)
                    .animation(.default,value: places.count)
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
