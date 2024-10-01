//
//  SwiftDataProject_sUI_App.swift
//  SwiftDataProject(sUI)
//
//  Created by David Guffre on 10/1/24.
//


import SwiftData
import SwiftUI

@main
struct SwiftDataProject_sUI_App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
