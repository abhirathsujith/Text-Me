//
//  Text_MeApp.swift
//  Shared
//
//  Created by Abhirath Sujith on 04/07/22.
//

import SwiftUI

@main
struct Text_MeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
