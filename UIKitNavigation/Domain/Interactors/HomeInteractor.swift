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
import GXInject


class HomeInteracor {
    
    @Injected var homeAPIManager: HomeAPIManagerProtocol
    @Injected var homeDBManager: HomeDBManagerProtocol

    enum UseCases {
        case getAlcoDrinks
        case getAlcoCategories
    }
    
    // MARK: getAlcoDrinks
    
    func getAlcoDrinksFromWeb() -> AnyPublisher<AlcoDrinkList, Error> {
        homeAPIManager.getAlcoDrinks(endpoint: UseCases.getAlcoDrinks)
    }
    
    func getAlcoDrinksFromDB() -> [AlcoDrink] {
        homeDBManager.getAlcoDrinksFromDB(with: UseCases.getAlcoDrinks.entityName)
    }
    
    func updateDb(with drinks: [AlcoDrink]) {
        homeDBManager.updateAlcoDrinks(with: drinks)
    }
    
    func deleteOldDrinks() {
        homeDBManager.deleteOldDrinks(with: UseCases.getAlcoDrinks.entityName)
    }
    
    
    // MARK: getAlcoCategories

    func getAlcoCategoriesFromWeb() -> AnyPublisher<AlcoCategories, Error> {
        homeAPIManager.getCategories(endpoint: UseCases.getAlcoCategories)
    }
    
    func getAlcoCategoriesFromDB() -> [AlcoCategory] {
        homeDBManager.getAlcoCategoriesFromDB(with: UseCases.getAlcoCategories.entityName)
    }
    
    func updateCategoriesDB(with categories: [AlcoCategory]) {
        homeDBManager.updateAlcoCategories(with: categories)
    }
    

    func deleteOldCategories() {
        homeDBManager.deleteOldCategories(with: UseCases.getAlcoCategories.entityName)
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
