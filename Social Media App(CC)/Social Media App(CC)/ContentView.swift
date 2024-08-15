//
//  ContentView.swift
//  Social Media App(CC)
//
//  Created by David Guffre on 8/14/24.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        ZStack {
            Color(red: 21/255, green: 21/255, blue:21/255)

            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                    .foregroundStyle(.yellow)
                    .font(.largeTitle)
                    .bold()
                
                
            }
            
            .padding()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
