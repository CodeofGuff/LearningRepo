//
//  UserData.swift
//  RandomUser(CC)
//
//  Created by David Guffre on 8/15/24.
//

import Foundation



// retrieve data from the Random User Generated API and store it into your Random Users application

// All UI Updates MUST Occure on the main thread
@MainActor
class UserData: ObservableObject {
    @Published var users: String = ""
    
    init() {
        Task {
            await loadUsers()
        }
    }
    
    func loadUsers() async {
        do {
            let users = try await UserFetchingClient.getUsers()
            self.users = users
        }
        catch {
            print(error)
        }
    }
}
