//
//  TrainingPlanModel.swift
//  FitnesPlan
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let trainingPlan = try? newJSONDecoder().decode(TrainingPlan.self, from: jsonData)

import Foundation

// MARK: - TrainingPlanElement
struct TrainingPlanElement: Codable {
    let id, replay: Int
    let trainingPlanDescription: String?
    let exercise: Exercise
    let createdAt: String
    let createdBy: AtedByPlan
    let weight: Double
    let date, updatedAt: String
    let updatedBy: AtedByPlan
    let user: User
    let analize: String?
    let counter: Int

    enum CodingKeys: String, CodingKey {
        case id, replay
        case trainingPlanDescription = "description"
        case exercise
        case createdAt = "created_at"
        case createdBy = "created_by"
        case weight, date
        case updatedAt = "updated_at"
        case updatedBy = "updated_by"
        case user, analize, counter
    }
}

// MARK: - AtedBy
struct AtedByPlan: Codable {
    let username: JSONNull?
    let id: Int
    let lastname: String?
    let firstname: String?
}

// MARK: - Exercise
struct Exercise: Codable {
    let movie: JSONNull?
    let id, createdBy: Int
    let name: String
    let exerciseDescription: String?
    let updatedBy: Int

    enum CodingKeys: String, CodingKey {
        case movie, id
        case createdBy = "created_by"
        case name
        case exerciseDescription = "description"
        case updatedBy = "updated_by"
    }
}

// MARK: - User
struct User: Codable {
    let id: Int
    let provider: String
    let blocked: Bool
    let createdAt, surname: String
    let createdBy: Int
    let confirmed: Bool
    let birthday, updatedAt, username: String
    let role, updatedBy: Int
    let email, name: String

    enum CodingKeys: String, CodingKey {
        case id, provider, blocked
        case createdAt = "created_at"
        case surname
        case createdBy = "created_by"
        case confirmed, birthday
        case updatedAt = "updated_at"
        case username, role
        case updatedBy = "updated_by"
        case email, name
    }
}

typealias TrainingPlan = [TrainingPlanElement]