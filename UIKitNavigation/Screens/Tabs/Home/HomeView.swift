//
//  HomeView.swift
//  UIKitNavigation
//
//  Created by Danil on 15.12.2021.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        ScrollView {
            HStack {
                Text("Popular Liquor")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding([.horizontal, .bottom])
            VStack {
                switch viewModel.loadState {
                case .idle:
                    ForEach(0..<10) { item in
                        AlcoCard(alcoTitle: "aaafaf123a", alcoInfo: "375 ml, 5%", alcoPrice: "$ 2.30", alcoImage: "")
                    }
                    .redacted(reason: .placeholder)
                case .loading:
                    ZStack {
                        VStack {
                            ForEach(0..<10) { item in
                                AlcoCard(alcoTitle: "aaafaf123a", alcoInfo: "375 ml, 5%", alcoPrice: "$ 2.30", alcoImage: "")
                                    .opacity(0.9)
                            }
                            .redacted(reason: .placeholder)
                        }

                        ProgressView()
                    }
                case .fail:
                    Text("Error")
                case .success:
                    ForEach(viewModel.alcoData.drinks, id: \.self.idDrink) { item in
                        AlcoCard(alcoTitle: item.strDrink, alcoInfo: "375 ml, 5%", alcoPrice: "$ 2.30", alcoImage: item.strDrinkThumb)
                    }
                }

            }
            
        }
        .onAppear {
            viewModel.getAlcoDrinks()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(services: AppServices(), presenter: HomePresenter(interacor: HomeInteracor())))
    }
}
