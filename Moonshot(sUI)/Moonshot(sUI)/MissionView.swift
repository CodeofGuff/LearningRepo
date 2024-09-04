//  MissionView.swift
//  Moonshot(sUI)
//
//  Created by David Guffre on 9/2/24.
//
//Add the launch date to MissionView, below the mission badge. You might choose to format this differently given that more space is available, but it’s down to you.
//Extract one or two pieces of view code into their own new SwiftUI views – the horizontal scroll view in MissionView is a great candidate.

import SwiftUI

struct MissionView: View {
	struct CrewMember {
		let role: String
		let astronaut: Astronaut
	}
	
	let mission: Mission
	let crew: [CrewMember]
	@State private var selectedAstronaut: Astronaut?
	@State private var showingSheet = false
	
	var body: some View {
		ScrollView {
			VStack {
				Image(mission.image)
					.resizable()
					.scaledToFit()
					.containerRelativeFrame(.horizontal) { width, axis in
						width * 0.6
					}
				
				VStack(alignment: .leading) {
					Rectangle()
						.frame(height: 2)
						.foregroundStyle(.lightBackground)
						.padding(.vertical)
					
					Text("Mission Highlights")
						.font(.title.bold())
						.padding(.bottom, 5)
						.foregroundColor(.yellow)
					
					Text(mission.description)
					
					Rectangle()
						.frame(height: 2)
						.foregroundStyle(.lightBackground)
						.padding(.vertical)
					
					Text("Crew")
						.font(.title.bold())
						.padding(.bottom, 5)
						.foregroundStyle(.yellow)
				}
				.padding(.horizontal)
				
				ScrollView(.horizontal, showsIndicators: false) {
					HStack {
						ForEach(crew, id: \.role) { crewMember in
							Button {
								selectedAstronaut = crewMember.astronaut
								showingSheet.toggle()
							} label: {
								HStack {
									Image(crewMember.astronaut.id)
										.resizable()
										.frame(width: 104, height: 72)
										.clipShape(Capsule())
										.overlay(
											Capsule()
												.strokeBorder(.white, lineWidth: 1)
										)
									
									VStack(alignment: .leading) {
										Text(crewMember.astronaut.name)
											.foregroundStyle(.white)
											.font(.headline)
										Text(crewMember.role)
											.foregroundStyle(.white.opacity(0.5))
									}
								}
								.padding(.horizontal)
							}
						}
					}
				}
				.padding(.bottom)
			}
		}
		.navigationTitle(mission.displayName)
		.navigationBarTitleDisplayMode(.inline)
		.background(.darkBackground)
		.sheet(item: $selectedAstronaut) { astronaut in
			AstronautView(astronaut: astronaut)
		}
		.preferredColorScheme(.dark)
	}
	
	init(mission: Mission, astronauts: [String: Astronaut]) {
		self.mission = mission
		
		self.crew = mission.crew.map { member in
			if let astronaut = astronauts[member.name] {
				return CrewMember(role: member.role, astronaut: astronaut)
			} else {
				fatalError("Missing \(member.name)")
			}
		}
	}
}

#Preview {
	let missions: [Mission] = Bundle.main.decode("missions.json")
	let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
	
	return MissionView(mission: missions[0], astronauts: astronauts)
		.preferredColorScheme(.dark)
}
