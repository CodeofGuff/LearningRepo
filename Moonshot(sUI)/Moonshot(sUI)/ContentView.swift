//
//  ContentView.swift
//  Moonshot(sUI)
//
//  Created by David Guffre on 9/1/24.
//
import SwiftUI

struct ContentView: View {
	@State private var animationAmount: Double = 0.0
	@State var mainColor = Color(red: 30/255, green: 30/255, blue: 30/255)
	
	
	let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
	let missions: [Mission] = Bundle.main.decode("missions.json")
	
	let columns = [
		GridItem(.adaptive(minimum: 150))
	]
	
	var body: some View {
		NavigationStack {
			ScrollView {
				LazyVGrid(columns: columns) {
					ForEach(missions) { mission in
						NavigationLink {
							MissionView(mission: mission, astronauts: astronauts)
						} label: {
							VStack {
								Image(mission.image)
									.resizable()
									.scaledToFit()
									.frame(width: 100, height: 100)
									.padding()
								
								VStack {
									Text(mission.displayName)
										.font(.headline)
										.foregroundStyle(.yellow)
									Text(mission.formattedLaunchDate)
										.font(.caption)
										.foregroundStyle(.gray)
								}
								.padding(.vertical)
								.frame(maxWidth: .infinity)
								.background(.lightBackground)
							}
							.clipShape(.rect(cornerRadius: 10))
							.overlay(
							RoundedRectangle(cornerRadius: 10)
								.stroke(.lightBackground)
							)
						}
					}
				}
				.padding([.horizontal, .bottom])
			}
			.navigationTitle("Moonshot")
			.background(.darkBackground)
			.preferredColorScheme(.dark)
		}
	}
}

#Preview {
	ContentView()
}

