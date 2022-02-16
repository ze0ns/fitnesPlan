//
//  UserProfile.swift
//  Sport 2022
//
//  Created by Марк Киричко on 04.02.2022.
//

import Foundation

// MARK: - UserProfile
struct UserProfile: Codable {
    let jwt: String
    let user: UserP
}

import Foundation

// MARK: - User
struct UserP: Codable {
    let id: Int
    let provider: String
    let blocked: Bool
    let createdAt, surname: String
    let confirmed: Bool
    let birthday, updatedAt, username: String
    let role: RoleP
    let email, name: String

    enum CodingKeys: String, CodingKey {
        case id, provider, blocked
        case createdAt = "created_at"
        case surname, confirmed, birthday
        case updatedAt = "updated_at"
        case username, role, email, name
    }
}

// MARK: - Role
struct RoleP: Codable {
    let id: Int
    let name, roleDescription, type: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case roleDescription = "description"
        case type
    }
}

