//
//  UsersView.swift
//  RandomUser(CC)
//
//  Created by David Guffre on 8/15/24.
//

import SwiftUI

struct UsersView: View {
    @StateObject var userData = UserData()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Raw JSON Data:")
                ScrollView {
                    Text(userData.users)
                }
            }
            .padding()
            .navigationTitle("Random Users")
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}


// I built a working application to fetch JSON of randomly generated users.
// I applied the @MainActor attribute to update your model on the main thread after obtaining random users asynchronously using async and await.
// I retrieved JSON from the Random User Generator API using a URLSession.

