//
//  customModel.swift
//  FitnesPlan
//
//  Created by Oschepkov Aleksandr on 31.01.2022.
//

//import Foundation
//// MARK: - AtedBy
//struct AtedBy: Codable {
//    let username: JSONNull?
//    let id: Int
//    let lastname, firstname: String
//}
//
//// MARK: - Role
struct Role: Codable {
    let updatedBy: String?
    let id: Int
    let createdBy: String?
    let name, roleDescription, type: String

    enum CodingKeys: String, CodingKey {
        case updatedBy = "updated_by"
        case id
        case createdBy = "created_by"
        case name
        case roleDescription = "description"
        case type
    }
}

