//
//  SMSBlocks.swift
//  UIKitNavigation
//
//  Created by Danil on 21.12.2021.
//

import Foundation
import SwiftUI

struct SMSBlocks: UIViewRepresentable {
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        @Binding var nextResponder: Bool?
        @Binding var isResponder: Bool?

        init(text: Binding<String>, nextResponder: Binding<Bool?>, isResponder: Binding<Bool?>) {
            _text = text
            _isResponder = isResponder
            _nextResponder = nextResponder
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.text = textField.text ?? ""
            }
        }

        func textFieldDidBeginEditing(_: UITextField) {
            DispatchQueue.main.async {
                self.isResponder = true
            }
        }

        func textFieldDidEndEditing(_: UITextField) {
            DispatchQueue.main.async {
                self.isResponder = false
            }
            if nextResponder != nil {
                nextResponder = true
            }
        }
    }

    @Binding var text: String
    @Binding var nextResponder: Bool?
    @Binding var isResponder: Bool?

    var isSecured: Bool = false
    var keyboard: UIKeyboardType

    func makeUIView(context: UIViewRepresentableContext<SMSBlocks>) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.isSecureTextEntry = isSecured
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.keyboardType = keyboard
        textField.textContentType = .oneTimeCode
        textField.textColor = .clear
        textField.tintColor = .clear
        textField.delegate = context.coordinator
        return textField
    }

    func makeCoordinator() -> SMSBlocks.Coordinator {
        return Coordinator(text: $text, nextResponder: $nextResponder, isResponder: $isResponder)
    }

    func updateUIView(_ uiView: UITextField, context _: UIViewRepresentableContext<SMSBlocks>) {
        uiView.text = text
        if isResponder ?? false {
            uiView.becomeFirstResponder()
        }
    }
}
