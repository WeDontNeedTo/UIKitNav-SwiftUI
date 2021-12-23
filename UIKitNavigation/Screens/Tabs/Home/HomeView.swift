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
        ScrollView(.vertical) {
            PullToRefresh(coordinateSpaceName: "pullToRefresh") {
                  // do your stuff when pulled
                viewModel.getAlcoDrinks(isRefresh: true)
                viewModel.getAlcoCategories(isRefresh: true)
              }
            HStack {
                Text("Categories")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding([.horizontal, .bottom])
            
            VStack {
                switch viewModel.categoriesLoadState {
                case .idle:
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<10) { item in
                                Text("123123123123ADFasdasd")
                                    .padding()
                                    .background(Color.blue)
                            }
                            .redacted(reason: .placeholder)
                        }
                    }

                case .loading:
                    ZStack {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(0..<10) { item in
                                    Text("123123123123ADFasdasd")
                                        .padding()
                                        .background(Color.blue)
                                }
                                .redacted(reason: .placeholder)
                            }
                        }


                        ProgressView()
                    }
                case .fail:
                    Text("Error")
                case .success:
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.categories.drinks, id: \.self.hashValue) { item in
                                Text(item.strCategory)
                                    .padding()
                                    .background(Color.blue)
                            }
                            .redacted(reason: .placeholder)
                        }
                    }

                }
            }
            
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
        .coordinateSpace(name: "pullToRefresh")
        .onAppear {
            viewModel.getAlcoDrinks()
            viewModel.getAlcoCategories()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(services: AppServices(), presenter: HomePresenter(interacor: HomeInteracor())))
    }
}
