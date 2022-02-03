//
//  ExercisesLocalDB.swift
//  FitnesPlan
//
//  Created by Oschepkov Aleksandr on 03.02.2022.
//


import Foundation
import RealmSwift

class exerciseLocalDB: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var exerciseDescription: String?
    @objc dynamic var movie: String?
}
