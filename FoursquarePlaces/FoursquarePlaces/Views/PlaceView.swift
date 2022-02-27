//
//  LocationView.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/27/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct PlaceView: View {
    
    @State var name = String()
    
    var body: some View {
        ZStack {
            //            Color(uiColor: .white)
            
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
                .background(.white)
            
            HStack{
                WebImage(url: URL(string: "https://fastly.4sqi.net/img/general/original/386427136_I5e039H76JppC17htf_W1O024KONpSL6cjmJVsjqps0.jpg")!)
                    .resizable()
                    .frame(width: 85, height: 85)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .background(.clear)

                Spacer()
                
                Text(name)
                    .multilineTextAlignment(.trailing)
                    .padding(.trailing, 10)
                    .font(Font.custom("Vazir-Medium", size: 14))
                    .background(.clear)
            }
            .background(.clear)
        }
        .background(.clear)

    }
}

struct PlaceView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceView()
    }
}
