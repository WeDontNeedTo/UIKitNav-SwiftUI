//
//  AlcoCategoryDTO.swift
//  UIKitNavigation
//
//  Created by Danil on 23.12.2021.
//

import Foundation
import CoreData
import Foundation

@objc(AlcoCategoryMO)
final class AlcoCategoryDTO: NSManagedObject, Storable {
    @NSManaged var name: String
}

extension AlcoCategoryDTO {
    func convertToAlcoCategoryModel() -> AlcoCategory {
        AlcoCategory(strCategory: name)
    }
}
