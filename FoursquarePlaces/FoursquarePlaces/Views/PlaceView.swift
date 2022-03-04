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
    @Environment(\.colorScheme) var colorScheme

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
            
            HStack{
                WebImage(url: buildImageURL())
                    .resizable()
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .frame(width: 85, height: 85)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .background(.clear)
                    

                Spacer()
                
                Text(place.name ?? "")
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .multilineTextAlignment(.trailing)
                    .padding(.trailing, 10)
                    .font(Font.custom("Vazir-Medium", size: 14))
                    .background(.clear)
            }
            .background(colorScheme == .dark ? Color(uiColor: .systemGray3) : Color(uiColor: .systemGray6))
            .cornerRadius(15)
        }
        .background(.clear)

    }
}

