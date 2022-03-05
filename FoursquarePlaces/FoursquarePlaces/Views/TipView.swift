//
//  TipView.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/5/22.
//

import SwiftUI

struct TipView: View{

    let loremIpsum = """
Lorem ipsum dolor sit amet consectetur adipiscing elit donec, gravida commodo hac non mattis augue duis vitae inceptos, laoreet taciti at vehicula cum arcu dictum. Cras netus vivamus sociis pulvinar est erat, quisque imperdiet velit a justo maecenas, pretium gravida ut himenaeos nam.
"""

    let date = Date()

    var body: some View {
        ZStack(alignment: .topTrailing){

            Text(loremIpsum)
                .lineLimit(nil)
                .font(.avenirNext(size: 15))
                .foregroundColor(.black)
                .padding(.top, 25)
                .padding(.horizontal, 15)
                .padding(.bottom, 15)

            Text(date, style: .date)
                .font(.avenirNext(size: 12))
                .foregroundColor(.black)
                .padding(10)
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
