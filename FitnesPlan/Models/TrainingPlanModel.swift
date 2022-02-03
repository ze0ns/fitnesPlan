//
//  TrainingPlanModel.swift
//  FitnesPlan
//
//  Created by Oschepkov Aleksandr on 03.02.2022.
//   let trainingPlan = try? newJSONDecoder().decode(TrainingPlan.self, from: jsonData)

import Foundation

// MARK: - TrainingPlanElement
struct TrainingPlanElement: Codable {
    let id, replay: Int
    let trainingPlanDescription: String
    let exercise: Exercise
    let createdAt: String
    let createdBy: String?
    let weight: Int
    let date, updatedAt: String
    let updatedBy: String?
    let user: User
    let analize: String
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
