//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by David Guffre on 8/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LinearGradient(stops: [
            Gradient.Stop(color: .gray, location: 0.1),
            Gradient.Stop(color: .blue, location: 0.9)
        ], startPoint: .top, endPoint: .bottom)
        .ignoresSafeArea()
            }
}


#Preview {
    ContentView()
}
