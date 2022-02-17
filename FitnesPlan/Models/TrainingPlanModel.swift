//
//  TrainingPlanModel.swift
//  FitnesPlan
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let trainingPlan = try? newJSONDecoder().decode(TrainingPlan.self, from: jsonData)

import Foundation
import RealmSwift


class TrainingPlan: Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var date: String
    @objc dynamic var exercise: Exercise
    @objc dynamic var replay, counter, weight: Int
    @objc dynamic var analize: String
    @objc dynamic var createdAt, updatedAt: Int
    @objc dynamic var exer: String

    enum CodingKeys: String, CodingKey {
        case id, date, exercise, replay, counter, weight, analize
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case exer
    }
}

// MARK: - Exercise
class  Exercise: Object, Codable {
    @objc dynamic var  id: Int
    @objc dynamic var  name: String
    @objc dynamic var  movie: String
}



//struct TrainingPlan: Codable {
//  var exercise, replay, weight, id: Int
//  var analize, createdAt, date: String
//  var counter: Int
//   var updatedAt: String
//   var exer: Exer
//
//    enum CodingKeys: String, CodingKey {
//        case exercise, replay, weight, id, analize
//        case createdAt = "created_at"
//        case date, counter
//        case updatedAt = "updated_at"
//        case exer
//    }
//}
//
//// MARK: - Exer
//struct Exer: Codable {
//     var id: Int
//     var name: String
//     var movie: String
//}

