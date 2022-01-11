//
//  LoginView.swift
//  UIKitNavigation
//
//  Created by Danil on 21.12.2021.
//

import SwiftUI
import GXUtilz

struct LoginView: View {
    var delegate: LoginViewControllerDelegate?
    @StateObject var viewModel: LoginViewModel
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text("Enter your phone number")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
            }
            .padding(.leading)
            HStack {
                Text("Login or sign up to place your order")
                    .font(.system(size: 16, weight: .light))
                Spacer()
            }
            .padding(.leading)
            .padding(.bottom)
            
            PhoneTextField(placeholder: "+7-900-000-00-00", text: $viewModel.phoneNumber)
                .frame(width: .displayWidth(90), alignment: .center)
                .keyboardType(.numberPad)
                .onChange(of: viewModel.phoneNumber) { newValue in
                    viewModel.phoneNumber = newValue.formatPhone()
                }

            Spacer()
            XButton(title: "Continue") {
                delegate?.didEnterPhoneNumber()
            }
            .padding()
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(delegate: nil, viewModel: LoginViewModel())
    }
}
