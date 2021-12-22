//
//  CoreDataManager.swift
//  UIKitNavigation
//
//  Created by Danil on 22.12.2021.
//

import Foundation
import CoreData
import Foundation

class CoreDataHelper: CoreDataManagerProtocol {
    var context: NSManagedObjectContext

    init(_ context: NSManagedObjectContext) {
        self.context = context
    }

    func createFetchRequest<T>(entityName: String, predicate _: NSPredicate?, sorted _: Sorted?) -> NSFetchRequest<T> where T: NSFetchRequestResult {
        NSFetchRequest<T>(entityName: entityName)
    }

    func get<T>(request: NSFetchRequest<T>, onSuccess: @escaping ([T]) -> Void, onError: @escaping () -> Void) where T: NSFetchRequestResult {
        do {
            let fetchedResult = try context.fetch(request)
            onSuccess(fetchedResult)
        } catch let err {
            debugPrint("error in fetch core data", err)
            onError()
        }
    }

    func update(onSuccess: @escaping () -> Void, onError: @escaping () -> Void) {
        if context.hasChanges {
            do {
                try context.save()
                onSuccess()
            } catch {
                debugPrint("error saving context while updating an object")
                onError()
            }
        }
    }

    func isSomeEntityExists(entityName: String) -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.includesSubentities = false

        var entitiesCount = 0

        do {
            entitiesCount = try context.count(for: fetchRequest)
        } catch {
            debugPrint("error executing fetch request: \(error)")
        }

        return entitiesCount > 0
    }

    func create<T>(model: T.Type) -> T? {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: String(describing: model.self).replacingOccurrences(of: "DTO", with: ""),
                                                                 in: context) else { return nil }
        let entity = NSManagedObject(entity: entityDescription,
                                     insertInto: context)
        return entity as? T
    }

    func delete<T>(request: NSFetchRequest<T>, onSuccess _: @escaping () -> Void, onError _: @escaping () -> Void) where T: NSFetchRequestResult {
        if let objs = try? context.fetch(request) {
            for obj in objs where obj as? NSManagedObject != nil {
                context.delete(obj as! NSManagedObject)
            }
        }
    }
}
