//
//  XBorder.swift
//  UIKitNavigation
//
//  Created by Danil on 22.12.2021.
//

import SwiftUI

struct XBorder: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 6)
            .strokeBorder(Color.secondary, lineWidth: 0.5)
    }
}

struct XBorder_Previews: PreviewProvider {
    static var previews: some View {
        XBorder()
    }
}
