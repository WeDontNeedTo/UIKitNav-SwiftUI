//
//  AlcoDrinkDTO.swift
//  UIKitNavigation
//
//  Created by Danil on 22.12.2021.
//

import Foundation
import CoreData
import Foundation

@objc(AlcoDrinkMO)
final class AlcoDrinkDTO: NSManagedObject, Storable {
    @NSManaged var id: String
    @NSManaged var name: String
    @NSManaged var imageURL: String
}

extension AlcoDrinkDTO {
    func convertToAlcoDrinkModel() -> AlcoDrink {
        AlcoDrink(strDrink: name, strDrinkThumb: imageURL, idDrink: id)
    }
}
