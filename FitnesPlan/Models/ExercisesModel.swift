// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let exercises = try? newJSONDecoder().decode(Exercises.self, from: jsonData)

import Foundation

// MARK: - Exercise
struct Exercise: Codable {
    let id: Int
    let name: String
    let exerciseDescription: String?
    let createdBy, updatedBy: AtedBy
    let createdAt, updatedAt: String
   // let movie: JSONNull?
    let movie: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case exerciseDescription = "description"
        case createdBy = "created_by"
        case updatedBy = "updated_by"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case movie
    }
}

