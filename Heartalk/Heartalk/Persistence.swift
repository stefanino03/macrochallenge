//
//  Persistence.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 19/06/23.
//

import Foundation
import CoreData

struct PersistenceController
    {
        static let shared = PersistenceController()
        static var preview: PersistenceController =
            {
                let result = PersistenceController(inMemory: true)
                let viewContext = result.container.viewContext
                for x in 0..<10
                    {
                        let newQuote = Quote(context: viewContext)
                        newQuote.phrase = "Ti amo \(x)"
                    }
                do
                    {
                        try viewContext.save()
                    }
                catch
                    {
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                    }
                return result
            }()
        let container: NSPersistentContainer
        init(inMemory: Bool = false)
            {
                container = NSPersistentContainer(name: "CoreDataModel")
                if inMemory
                    {
                        container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
                    }
                container.loadPersistentStores(completionHandler:
                    {
                        (storeDescription, error) in if let error = error as NSError?
                            {
                                fatalError("Unresolved error \(error), \(error.userInfo)")
                            }
                    })
                container.viewContext.automaticallyMergesChangesFromParent = true
            }
    }
