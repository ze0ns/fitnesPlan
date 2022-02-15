// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let exercises = try? newJSONDecoder().decode(Exercises.self, from: jsonData)

import Foundation
import RealmSwift

// MARK: - Exercise
//Модель данных используемая для созранения списка упражнений с сервера
class ExerciseProfiles: Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var name: String
    @objc dynamic var movie: String
}
