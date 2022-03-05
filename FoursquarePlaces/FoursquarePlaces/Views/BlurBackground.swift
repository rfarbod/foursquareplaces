//
//  BlurBackground.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/5/22.
//

import SwiftUI

struct BlurBackground: View{

    var color: Color
    var blur: CGFloat

    var body: some View {
        Rectangle()
            .fill(color)
            .blur(radius: blur)
    }
}

