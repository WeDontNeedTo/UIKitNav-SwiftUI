//
//  InfoView.swift
//  UIKitNavigation
//
//  Created by Danil on 21.12.2021.
//

import SwiftUI

struct InfoView: View {
    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text("Welcome to Evening Brew")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
            }
            .padding(.leading)
            .padding(.bottom)
            
            Spacer()
    
            Text("Thanks for joining Evening Brew !")
                .foregroundColor(.mainColor)
                .font(.system(size: 23, weight: .light))

            Spacer()
            XButton(title: "Continue") {
                viewModel.logIn()
            }
            .padding()
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(viewModel: LoginViewModel(services: AppServices()))
    }
}
