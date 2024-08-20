//
//  ContentView.swift
//  UnitTests(CC)
//
//  Created by David Guffre on 8/20/24.
//
import SwiftUI

struct ContentView: View {
	
	var body: some View {
		ZStack {
			Color(red: 21/255, green: 21/255, blue:21/255).ignoresSafeArea()
			
			VStack {
				Image(systemName: "macpro.gen1.fill")
					.resizable()
					.frame(width: 50, height: 50)
					.foregroundStyle(.red)
				Text("Hello, David")
					.foregroundStyle(.yellow)
					.font(.largeTitle)
					.bold()
			}
		}
	}
}

#Preview {
	ContentView()
}
