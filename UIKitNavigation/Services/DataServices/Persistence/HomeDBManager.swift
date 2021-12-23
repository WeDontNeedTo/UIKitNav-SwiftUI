//
//  HomeDBManager.swift
//  UIKitNavigation
//
//  Created by Danil on 22.12.2021.
//

import Foundation
import CoreData

class HomeDBManager {
    let dbQueue = DispatchQueue(label: "coredata", qos: .background)
    let dbMananger = CoreDataHelper(PersistenceController.shared.container.viewContext)
    static let shared = HomeDBManager()


}
// MARK: - alco drinks
extension HomeDBManager {
    func getAlcoDrinksFromDB(with entityName: String) -> [AlcoDrink] {
        let request = NSFetchRequest<AlcoDrinkDTO>(entityName: entityName)
        var list: [AlcoDrink] = []
        dbMananger.get(request: request) { result in
            list = result.map { $0.convertToAlcoDrinkModel() }
        } onError: {
            debugPrint("error in fetch")
            list =  []
        }
        return list
    }
    
    func updateAlcoDrinks(with data: [AlcoDrink]) {
        dbQueue.async {
            data.forEach { drink in
                let localDrink = AlcoDrinkDTO(context: PersistenceController.shared.container.viewContext)
                localDrink.id = drink.idDrink
                localDrink.imageURL = drink.strDrinkThumb
                localDrink.name = drink.strDrink
                self.dbMananger.update {
                    debugPrint("success update \(drink)!")
                } onError: {
                    debugPrint("error update \(drink)!")
                }
            }
        }
    }
    
    func deleteOldDrinks(with entityName: String) {
        let request = NSFetchRequest<AlcoDrinkDTO>(entityName: entityName)
        dbQueue.async {
            self.dbMananger.delete(request: request) {
                debugPrint("success deleted items")
            } onError: {
                debugPrint("errors deleted items")
            }
        }
    }
}
// MARK: - alco category
extension HomeDBManager {
    func getAlcoCategoriesFromDB(with entityName: String) -> [AlcoCategory] {
        let request = NSFetchRequest<AlcoCategoryDTO>(entityName: entityName)
        var list: [AlcoCategory] = []
        dbMananger.get(request: request) { result in
            list = result.map { $0.convertToAlcoCategoryModel() }
        } onError: {
            debugPrint("error in fetch")
            list =  []
        }
        return list
    }
    
    func updateAlcoCategories(with data: [AlcoCategory]) {
        dbQueue.async {
            data.forEach { category in
                let localCategory = AlcoCategoryDTO(context: PersistenceController.shared.container.viewContext)
                localCategory.name = category.strCategory
                self.dbMananger.update {
                    debugPrint("success update \(category)!")
                } onError: {
                    debugPrint("error update \(category)!")
                }
            }
        }
    }
    
    func deleteOldCategories(with entityName: String) {
        let request = NSFetchRequest<AlcoCategoryDTO>(entityName: entityName)
        dbQueue.async {
            self.dbMananger.delete(request: request) {
                debugPrint("success deleted items")
            } onError: {
                debugPrint("errors deleted items")
            }
        }
    }
}
