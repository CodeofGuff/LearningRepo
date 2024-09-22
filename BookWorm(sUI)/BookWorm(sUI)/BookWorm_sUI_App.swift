//
//  BookWorm_sUI_App.swift
//  BookWorm(sUI)
//
//  Created by David Guffre on 9/22/24.
//

import SwiftData
import SwiftUI

@main // this is what launches our app
struct BookWorm_sUI_App: App {
    var body: some Scene {
        WindowGroup { // tells SwiftUI the app can be displays in multiple windows
            ContentView()
        }
		.modelContainer(for: Book.self) // where data is stored
		
    }
}
