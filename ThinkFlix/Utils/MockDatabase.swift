//
//  MockDatabase.swift
//  ThinkFlix
//
//  Created by Reuben Simphiwe Kuse on 2024/10/23.
//

import Foundation


class MockDatabase {
    static var users: [User] = []

    static func registerUser(_ user: User) {
        users.append(user)
        print("User \(user.name) \(user.surname) registered.")
    }

    static func fetchUsers() -> [User] {
        return users
    }
}
