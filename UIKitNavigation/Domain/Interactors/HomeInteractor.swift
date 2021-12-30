//
//  HomeInteractor.swift
//  UIKitNavigation
//
//  Created by Danil on 22.12.2021.
//

import Foundation
import GXBaseAPI
import Combine
import CoreData


class HomeInteracor {

    enum UseCases {
        case getAlcoDrinks
        case getAlcoCategories
    }
    
    // MARK: getAlcoDrinks
    
    func getAlcoDrinksFromWeb() -> AnyPublisher<AlcoDrinkList, Error> {
        HomeAPIManager.shared.getAlcoDrinks(endpoint: UseCases.getAlcoDrinks)
    }
    
    func getAlcoDrinksFromDB() -> [AlcoDrink] {
        HomeDBManager.shared.getAlcoDrinksFromDB(with: UseCases.getAlcoDrinks.entityName)
    }
    
    func updateDb(with drinks: [AlcoDrink]) {
        HomeDBManager.shared.updateAlcoDrinks(with: drinks)
    }
    
    func deleteOldDrinks() {
        HomeDBManager.shared.deleteOldDrinks(with: UseCases.getAlcoDrinks.entityName)
    }
    
    
    // MARK: getAlcoCategories

    func getAlcoCategoriesFromWeb() -> AnyPublisher<AlcoCategories, Error> {
        HomeAPIManager.shared.getCategories(endpoint: UseCases.getAlcoCategories)
    }
    
    func getAlcoCategoriesFromDB() -> [AlcoCategory] {
        HomeDBManager.shared.getAlcoCategoriesFromDB(with: UseCases.getAlcoCategories.entityName)
    }
    
    func updateCategoriesDB(with categories: [AlcoCategory]) {
        HomeDBManager.shared.updateAlcoCategories(with: categories)
    }
    

    func deleteOldCategories() {
        HomeDBManager.shared.deleteOldCategories(with: UseCases.getAlcoCategories.entityName)
    }
}

//MARK: - use cases

extension HomeInteracor.UseCases: DBRequest {
    var entityName: String {
        switch self {
        case .getAlcoCategories:
            return "AlcoCategoryMO"
        case .getAlcoDrinks:
            return "AlcoDrinkMO"

        }
    }
    
}

extension HomeInteracor.UseCases: APICall {
    var path: String {
        switch self {
        case .getAlcoDrinks:
            return "filter.php?a=Alcoholic"
        case .getAlcoCategories:
            return "list.php?c=list"
        }
    }
    
    var method: HTTPMethod {
        .GET
    }
    
    var headers: HTTPHeaders? {
        nil
    }

}
