//
//  ContentView.swift
//  WorkScramble(sUI)
//
//  Created by David Guffre on 8/18/24.
//

import SwiftUI

struct ContentView: View {
	
	
	@State var mainColor = Color(red: 30/255, green: 30/255, blue: 30/255)

	
	var body: some View {
		ZStack {
			mainColor.ignoresSafeArea()
			
			
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
