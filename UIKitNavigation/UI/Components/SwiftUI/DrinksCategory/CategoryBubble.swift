//
//  CategoryBubble.swift
//  UIKitNavigation
//
//  Created by Danil on 30.12.2021.
//

import SwiftUI

struct CategoryBubble: View {
    var categoryTitle: String
    var body: some View {
        Text(categoryTitle)
            .fontWeight(.semibold)
            .padding(10)
            .background(
                Capsule(style: .continuous)
                    .fill(Color.mainColor)
            )
    }
}

struct CategoryBubble_Previews: PreviewProvider {
    static var previews: some View {
        CategoryBubble(categoryTitle: "Beer")
    }
}
