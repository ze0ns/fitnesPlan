//
//  LoginUser.swift
//  FitnesPlan
//
//  Created by Oschepkov Aleksandr on 30.01.2022.
//

import Foundation

// MARK: - LoginUser
struct userProfile: Codable {
    let jwt: String
    let user: User
}

// MARK: - User
struct User: Codable {
    let id: Int
    let username, email, provider: String
    let confirmed, blocked: Bool
    let role: Role
    let name, surname: String
    let birthday: JSONNull?
    let createdBy, updatedBy: AtedBy
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, username, email, provider, confirmed, blocked, role, name, surname, birthday
        case createdBy = "created_by"
        case updatedBy = "updated_by"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - AtedBy
struct AtedBy: Codable {
    let id: Int
    let firstname, lastname: String
    let username: JSONNull?
}

// MARK: - Role
struct Role: Codable {
    let id: Int
    let name, roleDescription, type: String
    let createdBy, updatedBy: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id, name
        case roleDescription = "description"
        case type
        case createdBy = "created_by"
        case updatedBy = "updated_by"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
