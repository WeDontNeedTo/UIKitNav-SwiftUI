//
//  Network.swift
//  UIKitNavigation
//
//  Created by Danil on 21.12.2021.
//

import Foundation
import GXBaseAPI
import Combine

protocol HomeAPIManagerProtocol {
    func getAlcoDrinks(endpoint: APICall) -> AnyPublisher<AlcoDrinkList, Error>
    
    func getCategories(endpoint: APICall) -> AnyPublisher<AlcoCategories, Error>
}

class HomeAPIManager: HomeAPIManagerProtocol, BaseAPIManagerProtocol {
    var baseURL: String = Constants.cocktailBaseURL
    
    func getAlcoDrinks(endpoint: APICall) -> AnyPublisher<AlcoDrinkList, Error> {
        return fetch(endpoint: endpoint)
    }
    
    func getCategories(endpoint: APICall) -> AnyPublisher<AlcoCategories, Error> {
        return fetch(endpoint: endpoint)
    }
    
}
