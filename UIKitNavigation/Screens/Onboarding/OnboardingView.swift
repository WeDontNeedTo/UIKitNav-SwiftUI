//
//  OnboardingView.swift
//  UIKitNavigation
//
//  Created by Danil on 20.12.2021.
//

import SwiftUI
import GXUtilz

struct OnboardingView: View {
    @StateObject var viewModel: OnboardingViewModel
    var body: some View {
        ZStack(alignment: .top) {
            Color.onboardingColor
                .frame(width: .displayWidth(100), height: .displayHeight(70))
                .cornerRadius(120, corners: [.bottomLeft, .bottomRight])
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Spacer()
                PageDots(index: $viewModel.selection, scale: .constant(1.0), maxIndex: viewModel.onboardingData.count)
                Spacer()

            }

            VStack {
                TabView(selection: $viewModel.selection) {
                    ForEach(0 ..< viewModel.onboardingData.count, id: \.self) { index in
                        VStack(spacing: 5) {
                            Spacer()

                            Image(viewModel.onboardingData[index].imageName)
                                .resizable()
                                .renderingMode(.original)
                                .scaledToFit()
                            
                            Spacer()
                            
                            VStack {
                                Text(viewModel.onboardingData[index].title)
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .padding(.bottom, 6)

                                Text(viewModel.onboardingData[index].subTitle)
                                    .font(.system(size: 12))
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 30)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.bottom, 6)
                                
                                if viewModel.selection == viewModel.onboardingData.count - 1 {
                                    XButton(title: "Get Started") {
                                        viewModel.goToLogIn()
                                    }
                                } else {
                                    Button(action:  {
                                        viewModel.goToLogIn()
                                    }) {
                                        Text("skip")
                                            .textCase(.uppercase)
                                            .foregroundColor(.mainColor)
                                            .font(.system(size: 16))
                                    }
                                }

                            }
                            .padding(.bottom, 30)
                        }
                    }
                }
                .ignoresSafeArea()
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .animation(.spring(), value: viewModel.selection)
            }
            .onAppear {
                viewModel.getOnboardingData()
            }
            if viewModel.loadState == .loading {
                StartView()
            }
        }
        .ignoresSafeArea()

    }
}

