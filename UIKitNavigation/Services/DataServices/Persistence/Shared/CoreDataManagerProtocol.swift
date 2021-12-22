//
//  CoreDataManagerProtocol.swift
//  UIKitNavigation
//
//  Created by Danil on 22.12.2021.
//

import Foundation
import CoreData
import Foundation

protocol DBRequest {
    var entityName: String { get }
}

protocol CoreDataManagerProtocol {
    func createFetchRequest<T>(entityName: String, predicate: NSPredicate?, sorted: Sorted?) -> NSFetchRequest<T>

    func get<T>(request: NSFetchRequest<T>, onSuccess: @escaping ([T]) -> Void, onError: @escaping () -> Void)

    func update(onSuccess: @escaping () -> Void, onError: @escaping () -> Void)

    func isSomeEntityExists(entityName: String) -> Bool

    func create<T: Storable>(model: T.Type) -> T?

    func delete<T>(request: NSFetchRequest<T>, onSuccess: @escaping () -> Void, onError: @escaping () -> Void)
}

public struct Sorted {
    var key: String
    var ascending: Bool = true
}

public protocol Storable {
    init()
}
