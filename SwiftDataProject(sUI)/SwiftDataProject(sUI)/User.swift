//
//  User.swift
//  SwiftDataProject(sUI)
//
//  Created by David Guffre on 10/1/24.
//

import Foundation
import SwiftData


@Model
class User {
    var name: String
    var city: String
    var joinDate: Date
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
