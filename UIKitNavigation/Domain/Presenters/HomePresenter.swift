//
//  HomePresenter.swift
//  UIKitNavigation
//
//  Created by Danil on 22.12.2021.
//

import Foundation
import Combine

protocol HomePresenterProtocol {
    func getAlcoDrinks(isRefresh: Bool, handler: @escaping (Result<AlcoDrinkList, String>) -> Void)
}

class HomePresenter: BasePresenter, HomePresenterProtocol {
    
    @Injected private var interacor: HomeInteracor
    
    func getAlcoDrinks(isRefresh: Bool = false, handler: @escaping (Result<AlcoDrinkList, String>) -> Void ) {
        let dbData = interacor.getAlcoDrinksFromDB()
        if dbData.isEmpty || isRefresh {
            debugPrint("get from web")
            baseRequest(publisher: interacor.getAlcoDrinksFromWeb()) { result in
                switch result {
                case .success(let data):
                    handler(.success(data))
                    self.interacor.deleteOldDrinks()
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
    
    func getAlcoCategories(isRefresh: Bool = false, handler: @escaping (Result<AlcoCategories, String>) -> Void ) {
        let dbData = interacor.getAlcoCategoriesFromDB()
        if dbData.isEmpty || isRefresh {
            debugPrint("get Categories from web")
            baseRequest(publisher: interacor.getAlcoCategoriesFromWeb()) { result in
                switch result {
                case .success(let data):
                    handler(.success(data))
                    self.interacor.deleteOldCategories()
                    self.interacor.updateCategoriesDB(with: data.drinks)
                    
                case .failure(let errorMessage):
                    handler(.failure(errorMessage))
                }
            }
        } else {
            debugPrint("get Categories from db")
            handler(.success(AlcoCategories(drinks: dbData)))
        }

    }
}
