//
//  TipView.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/5/22.
//

import SwiftUI

struct TipView: View{

    @State var tipText = String()

    let date = Date()

    var body: some View {
        ZStack(alignment: .topTrailing){
            Text(tipText)
                .lineLimit(nil)
                .font(Font.custom("Vazir-Medium", size: 15))
                .foregroundColor(.black)
                .padding(.top, 25)
                .padding(.horizontal, 15)
                .padding(.bottom, 15)
        }
        .background(Color.gray.brightness(0.4))
        .cornerRadius(10)
    }
}


struct TipView_Previews: PreviewProvider {
    static var previews: some View {
        TipView()
    }
}
