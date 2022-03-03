//
//  LocationView.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 2/27/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct PlaceView: View {
    
    @State var place : Place
    
    func buildImageURL() -> URL?{
        if let photos = place.photos {
            if photos.isEmpty == false {
                let prefix =  photos[0].prefix
                let suffix = photos[0].suffix
                let imageUrl = "\(prefix)200x200\(suffix)"
                return URL(string: imageUrl)
            }else{
                return URL(string: Path.Photos.noImage)
            }
        }else{
            return URL(string: Path.Photos.noImage)
        }
    }
    
    var body: some View {
        ZStack {
            //            Color(uiColor: .white)
            
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
                .background(.white)
            
            HStack{
                WebImage(url: buildImageURL())
                    .resizable()
                    .frame(width: 85, height: 85)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .background(.clear)

                Spacer()
                
                Text(place.name)
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

