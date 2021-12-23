//
//  StartView.swift
//  UIKitNavigation
//
//  Created by Danil on 21.12.2021.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        ZStack {
            Color.mainColor
                .ignoresSafeArea()
            Image("brewLogo")
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
