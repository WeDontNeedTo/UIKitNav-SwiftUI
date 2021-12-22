//
//  HomeDBManager.swift
//  UIKitNavigation
//
//  Created by Danil on 22.12.2021.
//

import Foundation
import CoreData

class HomeDBManager {
    let dbMananger = CoreDataHelper(PersistenceController.shared.container.viewContext)
    static let shared = HomeDBManager()

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
        DispatchQueue.global(qos: .background).async {
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
}
