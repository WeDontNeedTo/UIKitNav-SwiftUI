//
//  PageDots.swift
//  UIKitNavigation
//
//  Created by Danil on 21.12.2021.
//

import SwiftUI

struct PageDots: View {
    @Binding var index: Int
    @Binding var scale: Double
    let maxIndex: Int
    var selectedDotColor: Color = .mainColor
    var unselectedDotColor: Color = .secondary

    var body: some View {
        HStack(spacing: 20) {
            ForEach(0 ..< maxIndex, id: \.self) { index in
                Circle()
                    .fill(index == self.index ? selectedDotColor : unselectedDotColor)
                    .frame(width: 6, height: 6)
                    .scaleEffect(index == self.index ? scale : 1)
            }
        }
        .padding(.horizontal)
    }
}

