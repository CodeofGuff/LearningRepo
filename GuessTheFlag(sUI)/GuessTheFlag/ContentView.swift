//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by David Guffre on 8/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    
    var body: some View {
        VStack {
            Button("Show Alert") {
                showingAlert = true
            }
            .alert("ARE YOU SURE?", isPresented: $showingAlert) {
                Button("YES!", role: .destructive)  { }
                Button("NO!", role: .cancel) { }
            } message: {
                Text("This delete's everything forever")
            }
        }
    }
}


#Preview {
    ContentView()
}
