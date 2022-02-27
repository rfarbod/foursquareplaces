//
//  LocationView.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/27/22.
//

import SwiftUI

struct PlaceView: View {
    
    @State var name = String()
    
    var body: some View {
        Text(name)
    }
}

struct PlaceView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceView()
    }
}
