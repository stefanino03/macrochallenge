//
//  HeartalkApp.swift
//  Heartalk
//
//  Created by Stefano Giacobbe on 09/06/23.
//

import SwiftUI

@main
struct HeartalkApp: App
    {
        let persistenceController = PersistenceController.shared
        var body: some Scene
            {
                WindowGroup
                    {
                        ContentView()
                        .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    }
            }
    }
