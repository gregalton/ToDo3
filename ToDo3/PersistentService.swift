//
//  PersistentService.swift
//  ToDo3
//
//  Created by Greg Alton on 8/14/19.
//  Copyright © 2019 Greg Alton. All rights reserved.
//

import Foundation
import CoreData

class PersistentService {
    
    private init() {}
    
    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - Core Data stack
    
    static var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "ToDo3")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    static func getListItems() -> [ListItem] {
        var items = [ListItem]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ListItem")
        
        do {
            items = try self.context.fetch(request) as! [ListItem]
        } catch {
            fatalError("Failed to fetch list items: \(error)")
        }
        return items
    }
    
}
