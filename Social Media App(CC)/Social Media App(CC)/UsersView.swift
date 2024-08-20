//
//  ContentView.swift
//  Social Media App(CC)
//
//  Created by David Guffre on 8/14/24.
//

import SwiftUI

struct UsersView: View {
	@StateObject var userData = UserData()
	
	var body: some View {
		NavigationView {
			List(userData.users) { user in
				Text(user.fullName)
			}
			.navigationTitle("Random Users")
		}
	}
}


#Preview {
	UsersView()
}
