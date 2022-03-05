//
//  StatusView.swift
//  FoursquarePlaces
//
//  Created by Farbod Rahiminik on 3/5/22.
//

import SwiftUI

struct StatusView: View{

    enum Status{
        case open
        case close

        var isOpen: Bool {
            switch self {
            case .open:
                return true
            default:
                return false
            }
        }
    }

    var status: Status

    let openNow = "Open Now!"
    let closed = "Closed!"

    var body: some View {

        HStack(alignment: .center, spacing: 10) {
            Rectangle()
                .frame(width: 10, height: 10)
                .cornerRadius(5)
                .foregroundColor( status.isOpen ? .green : .red )

            Text(status.isOpen ? openNow : closed)
                .font(.avenirNext(size: 15))
                .foregroundColor( status.isOpen ? .green : .red )
        }
        .padding([.bottom, .trailing], 20)
        .padding([.top, .leading], 5)
        .background(BlurBackground(color: .white.opacity(0.5), blur: 10))
    }
}

