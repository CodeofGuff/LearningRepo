//
//  Mission.swift
//  Moonshot(sUI)
//
//  Created by David Guffre on 9/2/24.
//

import Foundation



struct Mission: Codable, Identifiable {
	
	struct CrewRole: Codable {
		let name: String
		let role: String
	}
	
	
	let id: Int
	let launchDate: Date?
	let crew: [CrewRole]
	let description: String
	
	var displayName: String {
		"Apollo \(id)"
	}
	
	var image: String {
		"apollo\(id)"
	}
	
	var formattedLaunchDate: String {
		launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "DNL"
	}
}
