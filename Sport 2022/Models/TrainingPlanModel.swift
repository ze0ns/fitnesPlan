//
//  TrainingPlanModel.swift
//  Sport 2022
//
//  Created by Марк Киричко on 04.02.2022.
//

import Foundation
import RealmSwift


class TrainingPlanElement: Object, Codable {
    @objc dynamic var exercise, replay, weight, id: Int
    @objc dynamic var analize, createdAt, date: String
    @objc dynamic var counter: Int
    @objc dynamic var updatedAt: String
    @objc dynamic var exer: trainig

    enum CodingKeys: String, CodingKey {
        case exercise, replay, weight, id, analize
        case createdAt = "created_at"
        case date, counter
        case updatedAt = "updated_at"
        case exer
    }
}

// MARK: - Exer
class trainig: Object, Codable {
    @objc dynamic var id = 1
    @objc dynamic var name = "Privet"
    @objc dynamic var movie =  "Strings"
}
