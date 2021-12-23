//
//  AlcoCategories.swift
//  UIKitNavigation
//
//  Created by Danil on 23.12.2021.
//

import Foundation

struct AlcoCategories: Codable {
    var drinks: [AlcoCategory] = []
}

struct AlcoCategory: Codable, Hashable {
    var strCategory: String = ""
}
