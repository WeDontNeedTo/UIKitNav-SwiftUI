//
//  AlcoList.swift
//  UIKitNavigation
//
//  Created by Danil on 30.12.2021.
//

import SwiftUI

struct AlcoList: View {
    @Binding var loadState: LoadState
    var drinks: [AlcoDrink] = []
    
    var body: some View {
        VStack {
            switch loadState {
            case .idle, .loading:
                ForEach(0..<10) { item in
                    AlcoCard(alcoTitle: "aaafaf123a", alcoInfo: "375 ml, 5%", alcoPrice: "$ 2.30", alcoImage: "")
                }
                .redacted(reason: .placeholder)
            case .fail:
                Text("Ooops... Error")
            case .success:
                ForEach(drinks, id: \.self.idDrink) { item in
                    AlcoCard(alcoTitle: item.strDrink, alcoInfo: "375 ml, 5%", alcoPrice: "$ 2.30", alcoImage: item.strDrinkThumb)
                }
            }
        }
    }
}

struct AlcoList_Previews: PreviewProvider {
    static var previews: some View {
        AlcoList(loadState: .constant(.idle))
    }
}
