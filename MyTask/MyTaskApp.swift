//
//  MyTaskApp.swift
//  MyTask
//
//  Created by Harish on 20/08/23.
//

import SwiftUI

@main
struct MyTaskApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
