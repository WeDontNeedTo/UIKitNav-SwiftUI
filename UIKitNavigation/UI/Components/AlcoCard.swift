//
//  AlcoCard.swift
//  UIKitNavigation
//
//  Created by Danil on 22.12.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct AlcoCard: View {
    var alcoTitle: String = ""
    var alcoInfo: String = ""
    var alcoPrice: String = ""
    var alcoImage: String = ""
    var body: some View {
        HStack {
            WebImage(url: URL(string: alcoImage))
                .placeholder(content: {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(UIColor.lightGray))
                })
                .resizable()
                .scaledToFill()
                .frame(width: .displayWidth(21.3), height: .displayWidth(26.5), alignment: .center)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 4) {
                Text(alcoTitle)
                    .font(.system(size: 16, weight: .semibold))
                
                Text(alcoInfo)
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                
                Text(alcoPrice)
                    .foregroundColor(.mainColor)
                    .font(.system(size: 24, weight: .bold))
            }
            .padding(.trailing)
            Spacer()
            
        }
        .background(XBorder())
        .shadow(radius: 0.3)
        .padding(.horizontal)

    }
}

struct AlcoCard_Previews: PreviewProvider {
    static var previews: some View {
        AlcoCard(alcoTitle: "Smirnoff Lemon Vodka", alcoInfo: "375 ml, 5%", alcoPrice: "$ 2.30")
    }
}
