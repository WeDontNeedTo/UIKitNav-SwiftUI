//
//  HomeView.swift
//  UIKitNavigation
//
//  Created by Danil on 15.12.2021.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    var delegate: HomeViewControllerDelegate?
    
    var body: some View {
        ScrollView(.vertical) {
            PullToRefresh(coordinateSpaceName: "pullToRefresh") {
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
                CategoryList(loadState: $viewModel.categoriesLoadState, drinks: viewModel.categories.drinks)
            }
            .padding(.bottom)

            
            HStack {
                Text("Popular Liquor")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding([.horizontal, .bottom])
            
            AlcoList(
                loadState: $viewModel.loadState,
                drinks: viewModel.alcoData.drinks,
                delegate: delegate
            )
                .padding(.bottom)
            
        }
        .coordinateSpace(name: "pullToRefresh")
        .onAppear {
            if viewModel.alcoData.drinks.isEmpty || viewModel.categories.drinks.isEmpty {
                viewModel.getAlcoDrinks()
                viewModel.getAlcoCategories()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
