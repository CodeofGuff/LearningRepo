//
//  ContentView.swift
//  Navigation(sUI)
//
//  Created by David Guffre on 9/4/24.
//

import SwiftUI
struct DetailView: View {
	var number: Int
	var body: some View {
		NavigationLink("Go to random number", value: Int.random(in: 1...1000))
			.navigationTitle("Number: \(number)")
	}
}

struct ContentView: View {
	@State private var path = [Int]()
	
	var body: some View {
		NavigationStack(path: $path) {
			DetailView(number: 0)
				.navigationDestination(for: Int.self) { i in
					DetailView(number: i)
				}
		}
	}
}

#Preview {
	ContentView()
}
