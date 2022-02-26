//
//  ContentView.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/26/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
        Text("Hello, world!")
            .padding()
            .navigationTitle("Nearby Places")
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
