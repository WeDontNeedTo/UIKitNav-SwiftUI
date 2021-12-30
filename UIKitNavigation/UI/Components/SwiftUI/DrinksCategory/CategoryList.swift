//
//  CategoryList.swift
//  UIKitNavigation
//
//  Created by Danil on 30.12.2021.
//

import SwiftUI

struct CategoryList: View {
    @Binding var loadState: LoadState
    var drinks: [AlcoCategory] = []
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                switch loadState {
                case .idle, .loading:
                    ForEach(0..<5) { item in
                        CategoryBubble(categoryTitle: String(repeating: "Beer", count: item + 1))
                    }
                    .redacted(reason: .placeholder)
                case .fail:
                    Text("Ooops...Error")
                case .success:
                    ForEach(drinks, id: \.self.hashValue) { item in
                        CategoryBubble(categoryTitle: item.strCategory)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList(loadState: .constant(.success), drinks: [AlcoCategory(strCategory: "Vodka")])
    }
}
