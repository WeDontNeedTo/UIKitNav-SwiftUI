//
//  PhoneTextField.swift
//  UIKitNavigation
//
//  Created by Danil on 21.12.2021.
//

import SwiftUI

struct PhoneTextField: View {
    var placeholder: String = ""
    @Binding var text: String
    var body: some View {
        TextField(placeholder, text: $text)
            .textFieldStyle(PlainTextFieldStyle())
            .multilineTextAlignment(.leading)
            .accentColor(.mainColor)
            .foregroundColor(.black)
            .font(.system(size: 14))
            .padding(.vertical, 12)
            .padding(.horizontal, 6)
            .background(border)
            .shadow(radius: 0.8)
    }
    
    var border: some View {
        XBorder()
    }
}

struct PhoneTextField_Previews: PreviewProvider {
    static var previews: some View {
        PhoneTextField(placeholder: "+7 900 000 00 00", text: .constant(""))
    }
}
