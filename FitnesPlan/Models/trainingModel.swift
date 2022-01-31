////
////  trainingModel.swift
////  FitnesPlan
////
////  Created by Oschepkov Aleksandr on 30.01.2022.
////
//
//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let trainings = try? newJSONDecoder().decode(Trainings.self, from: jsonData)
//
//import Foundation
//
//// MARK: - TrainingsValue
//struct TrainingsValue: Codable {
//    let id: Int
//    let date: String
//    let user: User
//    let exercise: Exercise
//    let replay, counter, weight: Int
//    let trainingsDescription, analize: String?
//    let createdBy, updatedBy: AtedBy?
//    let createdAt, updatedAt: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, date, user, exercise, replay, counter, weight
//        case trainingsDescription = "description"
//        case analize
//        case createdBy = "created_by"
//        case updatedBy = "updated_by"
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//    }
//}
//
//// MARK: - AtedBy
//struct AtedBy: Codable {
//    let id: Int
//    let firstname, lastname: String
//    let username: JSONNull?
//    let email, password: String
//    let resetPasswordToken, registrationToken: JSONNull?
//    let isActive: Bool
//    let blocked: JSONNull?
//}
//
//// MARK: - Exercise
//struct Exercise: Codable {
//    let id: Int
//    let name: String
//    let exerciseDescription: JSONNull?
//    let createdBy, updatedBy: Int
//    let createdAt, updatedAt: String
//    let movie: JSONNull?
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case exerciseDescription = "description"
//        case createdBy = "created_by"
//        case updatedBy = "updated_by"
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case movie
//    }
//}
//
//// MARK: - User
//struct User: Codable {
//    let id: Int
//    let username, email, provider, password: String
//    let resetPasswordToken: JSONNull?
//    let confirmed, blocked: Bool
//    let role: Int
//    let name, surname: String
//    let birthday: JSONNull?
//    let createdBy, updatedBy: Int
//    let createdAt, updatedAt: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, username, email, provider, password, resetPasswordToken, confirmed, blocked, role, name, surname, birthday
//        case createdBy = "created_by"
//        case updatedBy = "updated_by"
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//    }
//}
//
//typealias Trainings = [String: TrainingsValue]
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
//
