//
//  XButton.swift
//  UIKitNavigation
//
//  Created by Danil on 21.12.2021.
//

import SwiftUI

struct GreenButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .padding(.vertical, 4)
            .foregroundColor(.white)
            .frame(width: .displayWidth(90), alignment: .center)
            .background(Color.mainColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .opacity(configuration.isPressed ? 0.8 : 1)

    }
}

struct XButton: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .font(.system(size: 20, weight: .bold))
        }
        .buttonStyle(GreenButton())
    }
}

struct XButton_Previews: PreviewProvider {
    static var previews: some View {
        XButton(title: "Get Started", action: {})
    }
}
