//
//  PriceClass.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/5/22.
//

import SwiftUI

struct PriceClass: View{

    var `class`: Int
    let highestClass = 4
    let singleClassSize: CGFloat = 10

    let offImage = Image(systemName: "dollarsign.circle")
    let onImage = Image(systemName: "dollarsign.circle.fill")


    var body: some View {
        HStack(spacing: 2) {
            ForEach( 1 ..< highestClass + 1, id: \.self) { number in
                if number <= `class` {
                    onImage
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                        .frame(width: singleClassSize, height: singleClassSize)
                } else {
                    offImage
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                        .frame(width: singleClassSize, height: singleClassSize)
                }
            }
        }
    }

}

