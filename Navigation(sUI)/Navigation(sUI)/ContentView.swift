//
//  ContentView.swift
//  Navigation(sUI)
//
//  Created by David Guffre on 9/4/24.
//

import SwiftUI

struct ContentView: View {
	
	
	var body: some View {
		
		NavigationStack {
			NavigationLink("Tap Me") {
				Text("Thank you for submitting!")
			}
		}
		
	}
}
		
#Preview {
	ContentView()
}
