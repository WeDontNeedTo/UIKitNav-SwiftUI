//
//  HomeViewModel.swift
//  UIKitNavigation
//
//  Created by Danil on 22.12.2021.
//

import Foundation

class HomeViewModel: BaseViewModel<Services>, ObservableObject {
    private var presenter: HomePresenter
    
    init(services: Services, presenter: HomePresenter) {
        self.presenter = presenter
        super.init(services: services)
    }
    
    @Published var alcoData: AlcoDrinkList = AlcoDrinkList()
    @Published var categories: AlcoCategories = AlcoCategories()

    @Published var loadState: LoadState = .idle
    @Published var categoriesLoadState: LoadState = .idle

    
    func getAlcoDrinks(isRefresh: Bool = false) {
        guard loadState != .loading else { return }
        loadState = .loading
        presenter.getAlcoDrinks(isRefresh: isRefresh) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.alcoData = data
                self.loadState = .success
            case .failure(let errorMessage):
                debugPrint(errorMessage)
                self.loadState = .fail
            }
        }
    }
    
    func getAlcoCategories(isRefresh: Bool = false) {
        guard categoriesLoadState != .loading else { return }
        categoriesLoadState = .loading
        presenter.getAlcoCategories(isRefresh: isRefresh) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.categories = data
                self.categoriesLoadState = .success
            case .failure(let errorMessage):
                debugPrint(errorMessage)
                self.categoriesLoadState = .fail
            }
        }
    }
}
