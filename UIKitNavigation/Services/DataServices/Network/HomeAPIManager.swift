//
//  Network.swift
//  UIKitNavigation
//
//  Created by Danil on 21.12.2021.
//

import Foundation
import GXBaseAPI
import Combine

class HomeAPIManager: BaseAPIManagerProtocol {
    var baseURL: String = Constants.cocktailBaseURL
    
    static let shared = HomeAPIManager()
    
    
    func getAlcoDrinks(endpoint: APICall) -> AnyPublisher<AlcoDrinkList, Error> {
        return fetch(endpoint: endpoint)
    }
    
    func getCategories(endpoint: APICall) -> AnyPublisher<AlcoCategories, Error> {
        return fetch(endpoint: endpoint)
    }
    
}
