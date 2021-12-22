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
    @Published var loadState: LoadState = .idle
    
    func getAlcoDrinks() {
        guard loadState != .loading else { return }
        loadState = .loading
        presenter.getAlcoDrinks { [weak self] result in
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
}
