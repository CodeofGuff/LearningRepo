//
//  AstronautView.swift
//  Moonshot(sUI)
//
//  Created by David Guffre on 9/2/24.
//

import SwiftUI

struct AstronautView: View {
	
	let astronaut: Astronaut
	@Environment(\.dismiss) var dismiss
	
	var body: some View {
		ScrollView {
			VStack {
				Image(astronaut.id)
					.resizable()
					.scaledToFit()
				
				Text(astronaut.description)
					.padding()
				Button("back"){
					dismiss()
				}
					.foregroundStyle(.yellow)
			}
		}
		.background(.darkBackground)
		.navigationTitle(astronaut.name)
		.navigationBarTitleDisplayMode(.inline)
	}
}

#Preview {
	let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
	
	return AstronautView(astronaut: astronauts["aldrin"]!)
		.preferredColorScheme(.dark)
}
