//
//  Firebase_ChatApp.swift
//  Firebase Chat
//
//  Created by Nikhil on 31/12/22.
//

import SwiftUI

@main
struct Firebase_ChatApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
