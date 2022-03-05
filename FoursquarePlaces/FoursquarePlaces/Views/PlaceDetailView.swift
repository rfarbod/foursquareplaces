//
//  PlaceDetailView.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/5/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct PlaceDetailView: View {
    private let imageHeight: CGFloat = 200
    private let collapsedImageHeight: CGFloat = 75

    @State private var titleRect: CGRect = .zero
    @State private var headerImageRect: CGRect = .zero
    @State var place = Place()
    
    var tips = [0, 0, 0,
                0, 0, 0,
                0, 0, 0
    ]
    var body: some View {
            ZStack{
                ScrollView {
                    GeometryReader { geometry in
                        ZStack(alignment: .bottomLeading){

                            WebImage(url: buildImageURL())
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width,
                                       height: getHeightForHeaderImage(geometry))
                                .blur(radius: getBlurRadiusForImage(geometry))
                                .clipped()

                                .background(.cyan)
                                .foregroundColor(.indigo)

                            VStack(alignment: .leading, spacing: 0) {

                                Text(place.name ?? "")
                                    .font(.avenirNext(size: 17))
                                    .foregroundColor(.black)

                                PriceClass(class: 1)
                                    .padding(.bottom, 5)
                            }
                            .background(BlurBackground(color: .white.opacity(0.5), blur: 10))
                            .padding(10)
                        }
                        .offset(x: 0, y: self.getOffsetForHeaderImage(geometry))
                    }
                    .frame(height: imageHeight)
                    .zIndex(1)


                    HStack{
                        Text("Location")
                            .font(.avenirNext(size: 15))
                            .padding(15)
                        Spacer()
                    }

                    ZStack(alignment: .topLeading) {

                        MapView(latitude: Float (place.geocodes?.main?.latitude ?? 0), longitude:
                                    Float(place.geocodes?.main?.longitude ?? 0))
                            .frame(height: 200)

                        StatusView(status: .close)
                    }
                    .padding(.horizontal, 5)
                    .cornerRadius(10)
                    .onTapGesture {
                        openMap()
                    }


                    HStack{
                        Text("Tips")
                            .font(.avenirNext(size: 15))
                            .padding(15)
                        Spacer()
                    }

                    VStack(spacing: 15){
                        ForEach(0..<tips.count) { index in
                            TipView()
                        }
                    }
                    .padding(.horizontal, 5)

                }.edgesIgnoringSafeArea(.all)
            }
        }

    }

struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailView()
    }
}


extension PlaceDetailView {
    
    func buildImageURL() -> URL?{
        if let photos = place.photos {
            if photos.isEmpty == false {
                let prefix =  photos[0].prefix
                let suffix = photos[0].suffix
                guard let prefixUnwrapped = prefix else {return nil }
                guard let suffixUnwrapped = suffix else {return nil}
                let imageUrl = "\(prefixUnwrapped)original\(suffixUnwrapped)"
                return URL(string: imageUrl)
            }else{
                return URL(string: Path.Photos.noImage)
            }
        }else{
            return URL(string: Path.Photos.noImage)
        }
    }
    
    func openMap(){
        let url = URL(string: "maps://?saddr=&daddr=35.762758,51.438683")

        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        }
    }
    
    func getOffsetForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = getScrollOffset(geometry)
        let sizeOffScreen = imageHeight - collapsedImageHeight

        // Image was pulled up
        if offset < -sizeOffScreen {
            let imageOffset = abs(min(-sizeOffScreen, offset))
            return imageOffset - sizeOffScreen
        }

        // Image was pulled down
        if offset > 0 {
            return -offset
        }

        // Default
        return 0
    }
    func getScrollOffset(_ geometry: GeometryProxy) -> CGFloat {
        geometry.frame(in: .global).minY
    }
    
func getHeightForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
    let offset = getScrollOffset(geometry)
    let imageHeight = geometry.size.height

    if offset > 0 {
        return imageHeight + offset
    }

    return imageHeight
}

func getBlurRadiusForImage(_ geometry: GeometryProxy) -> CGFloat {
    let offset = geometry.frame(in: .global).maxY

    let height = geometry.size.height
    let blur = (height - max(offset, 0)) / height

    return blur * 6
}
}
