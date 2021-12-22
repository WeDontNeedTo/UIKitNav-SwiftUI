//
//  AlcoDrinks.swift
//  UIKitNavigation
//
//  Created by Danil on 22.12.2021.
//

import Foundation

struct AlcoDrinkList: Codable {
    var drinks: [AlcoDrink] = []
}

struct AlcoDrink: Codable {
    var strDrink: String = ""
    var strDrinkThumb: String = ""
    var idDrink: String = ""
}
