//
//  RockPaperScissorsApp.swift
//  RockPaperScissors
//
//  Created by Bünyamin Kılıçer on 25.12.2021.
//

import SwiftUI

@main
struct RockPaperScissorsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
