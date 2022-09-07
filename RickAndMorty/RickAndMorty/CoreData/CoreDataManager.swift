//
//  CoreDataManager.swift
//  RickAndMorty
//
//  Created by inputlagged on 9/3/22.
//

import CoreData

final class CoreDataManager {
    lazy var persistantContainer: NSPersistentContainer = {
        let persistantContainer = NSPersistentContainer(name: "Character")
        persistantContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return persistantContainer
    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
        return persistantContainer.viewContext
    }()
    
    func saveContext() {
        let context = managedObjectContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let error = error as NSError
                fatalError("Unresolved error \(error.userInfo)")
            }
        }
    }
}
