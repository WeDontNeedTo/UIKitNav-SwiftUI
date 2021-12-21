//
//  EnterCodeView.swift
//  UIKitNavigation
//
//  Created by Danil on 21.12.2021.
//

import Foundation
import SwiftUI

struct EnterCodeView: View {
    var delegate: EnterCodeViewControllerDelegate?
    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text("Verify mobile number")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
            }
            .padding(.leading)
            HStack {
                Text("Enter the OTP sent to \(viewModel.phoneNumber)")
                    .font(.system(size: 16, weight: .light))
                Spacer()
            }
            .padding(.leading)
            .padding(.bottom)
            SMSCodeFieldView { smscode, _ in
                viewModel.smsCode = smscode
            }
            .frame(height: 50)
            Spacer()
            XButton(title: "Continue") {
                delegate?.didEnterCode()
            }
            .padding()
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}
