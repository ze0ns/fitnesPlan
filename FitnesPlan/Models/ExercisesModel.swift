// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let exercises = try? newJSONDecoder().decode(Exercises.self, from: jsonData)

import Foundation
import RealmSwift

// MARK: - Exercise
//Модель данных используемая для созранения списка упражнений с сервера
struct ExerciseProfiles:  Codable {
     var id: Int
     var name: String
     var movie: String
}
