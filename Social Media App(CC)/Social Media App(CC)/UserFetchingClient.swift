//
//  UserFetchingClient.swift
//  RandomUser(CC)
//
//  Created by David Guffre on 8/15/24.
//

import Foundation


// fetching the UserDate rom the API

struct UserFetchingClient {
  static private let url = URL(string: "https://randomuser.me/api/?results=10&format=pretty")!
  
  static func getUsers() async throws -> String {
    async let (data, _) = URLSession.shared.data(from: url)
    return try await String(data: data, encoding: .utf8)!
  }
}
