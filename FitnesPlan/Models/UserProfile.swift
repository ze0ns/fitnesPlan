//
//  UserProfile.swift
//  FitnesPlan
//
//  Created by Oschepkov Aleksandr on 31.01.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userProfile = try? newJSONDecoder().decode(UserProfile.self, from: jsonData)

import Foundation

// MARK: - UserProfile
struct UserProfile: Codable {
    let jwt: String
    let user: UserP
}

// MARK: - User
struct UserP: Codable {
    let id: Int
    let provider: String
    let blocked: Bool
    let createdAt, surname: String
    let confirmed: Bool
    let birthday, updatedAt, username: String
    let role: Role
    let email, name: String

    enum CodingKeys: String, CodingKey {
        case id, provider, blocked
        case createdAt = "created_at"
        case surname, confirmed, birthday
        case updatedAt = "updated_at"
        case username, role, email, name
    }
}



