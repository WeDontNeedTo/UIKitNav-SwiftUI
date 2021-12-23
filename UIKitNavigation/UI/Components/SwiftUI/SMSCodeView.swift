//
//  SMSCodeView.swift
//  UIKitNavigation
//
//  Created by Danil on 21.12.2021.
//

import Foundation
import SwiftUI

public struct SMSCodeFieldView: View {
    var maxDigits: Int = 5
    var label = ""
    var spacing: CGFloat = 5

    @State var pin: String = ""
    @State var showPin = true
    @State var isDisabled = false

    @State private var isFirstResponder: Bool?

    var handler: (String, (Bool) -> Void) -> Void

    public var body: some View {
        VStack {
            Text(label).font(.title)
            ZStack {
                pinDots
                backgroundField
            }
        }
        .onAppear {
            isFirstResponder = true
        }
    }

    private var pinDots: some View {
        HStack(spacing: spacing) {
            ForEach(0 ..< maxDigits) { index in
                self.getCell(at: index)
                    .background(Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(pin.count == index ? Color.mainColor : Color.gray, lineWidth: pin.count == index ? 1.5 : 1)
                    )
            }
        }
    }

    private var backgroundField: some View {
        let boundPin = Binding<String>(get: { self.pin }, set: { newValue in
            self.pin = newValue
            self.submitPin()
        })
        return SMSBlocks(text: boundPin,
                         nextResponder: .constant(nil),
                         isResponder: $isFirstResponder,
                         isSecured: false,
                         keyboard: .numberPad)
    }

    private func submitPin() {
        if !pin.isEmpty {
            showPin = true
        } else {
            showPin = false
            return
        }

        // if pin.count == maxDigits {
        handler(pin) { isSuccess in
            if isSuccess {
                debugPrint("pin matched, go to next page, no action to perfrom here")
            } else {
                pin = ""
                isDisabled = false
                debugPrint("this has to called after showing toast why is the failure")
            }
        }
        // }

        if pin.count > maxDigits {
            pin = String(pin.prefix(maxDigits))
            submitPin()
        }
    }

    private func getCell(at index: Int) -> some View {
        if index >= pin.count {
            return VStack {
                Text("")
                    .font(.system(size: 18))
                    .tracking(0.34)
                    .multilineTextAlignment(.center)
                    .frame(width: 60, height: 60, alignment: .center)
            }
        }

        if showPin {
            return VStack {
                Text(pin.digits[index].numberString)
                    .font(.system(size: 18))
                    .tracking(0.34)
                    .multilineTextAlignment(.center)
                    .frame(width: 60, height: 60, alignment: .center)
            }
        }

        return VStack {
            Text(pin.digits[index].numberString)
                .font(.headline)
                .tracking(0.34)
                .multilineTextAlignment(.center)
                .frame(width: 60, height: 60, alignment: .center)
        }
    }
}

extension String {
    var digits: [Int] {
        var result = [Int]()

        for char in self {
            if let number = Int(String(char)) {
                result.append(number)
            }
        }

        return result
    }
}

extension Int {
    var numberString: String {
        guard self < 10 else { return "0" }

        return String(self)
    }
}

struct SMSCodeFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SMSCodeFieldView { _, _ in
        }
    }
}
