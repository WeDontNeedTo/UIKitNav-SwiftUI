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
    }
    
    func getAlcoDrinksFromWeb() -> AnyPublisher<AlcoDrinkList, Error> {
        HomeAPIManager.shared.getAlcoDrinks(endpoint: UseCases.getAlcoDrinks)
    }
    
    func getAlcoDrinksFromDB() -> [AlcoDrink] {
        HomeDBManager.shared.getAlcoDrinksFromDB(with: UseCases.getAlcoDrinks.entityName)
    }
    
    func updateDb(with drinks: [AlcoDrink]) {
        HomeDBManager.shared.updateAlcoDrinks(with: drinks)
    }
}

extension HomeInteracor.UseCases: DBRequest {
    var entityName: String {
        return "AlcoDrinkMO"
    }
    
}

extension HomeInteracor.UseCases: APICall {
    var path: String {
        switch self {
        case .getAlcoDrinks:
            return "filter.php?a=Alcoholic"
        }
    }
    
    var method: HTTPMethod {
        .GET
    }
    
    var headers: HTTPHeaders? {
        nil
    }

}
