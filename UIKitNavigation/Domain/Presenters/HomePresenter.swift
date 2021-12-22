//
//  HomePresenter.swift
//  UIKitNavigation
//
//  Created by Danil on 22.12.2021.
//

import Foundation
import Combine

protocol HomePresenterProtocol {
    func getAlcoDrinks(handler: @escaping (Result<AlcoDrinkList, String>) -> Void)
}

class HomePresenter: BasePresenter, HomePresenterProtocol {
    private var interacor: HomeInteracor
    
    init(interacor: HomeInteracor) {
        self.interacor = interacor
    }
    
    func getAlcoDrinks(handler: @escaping (Result<AlcoDrinkList, String>) -> Void ) {
        let dbData = interacor.getAlcoDrinksFromDB()
        if dbData.isEmpty {
            debugPrint("get from web")
            baseRequest(publisher: interacor.getAlcoDrinksFromWeb()) { result in
                switch result {
                case .success(let data):
                    handler(.success(data))
                    self.interacor.updateDb(with: data.drinks)
                    
                case .failure(let errorMessage):
                    handler(.failure(errorMessage))
                }
            }
        } else {
            debugPrint("get from db")
            handler(.success(AlcoDrinkList(drinks: dbData)))
        }

    }
}
