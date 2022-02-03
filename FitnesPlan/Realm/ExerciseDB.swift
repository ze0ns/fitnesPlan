////
////  ExerciseDB.swift
////  FitnesPlan
////
////  Created by Oschepkov Aleksandr on 31.01.2022.
////
//
import Foundation
import RealmSwift



class ExerciseDB {

     let config = Realm.Configuration(schemaVersion: 0)
     lazy var mainRealm = try! Realm(configuration: config)
     var ExerciseLocal: [ExerciseLocal] = []
    
    

     func addData(_ exerciseLocal: [ExerciseLocal]) {
        
        ExerciseLocal = exerciseLocal
        let exercise = exerciseLocalDB()
        let e = self.ExerciseLocal.count
        var i = 0
        mainRealm.beginWrite()
         while i < e {
             exercise.id = self.ExerciseLocal[i].id
             exercise.name = self.ExerciseLocal[i].name
             exercise.exerciseDescription = self.ExerciseLocal[i].exerciseDescription
             exercise.movie = self.ExerciseLocal[i].movie
         
         
             mainRealm.add(exercise)
             print(exercise.id, exercise.name, exercise.exerciseDescription, exercise.movie)
             i = i + 1
          }
         
        do {
            try mainRealm.commitWrite()
            print(mainRealm.configuration.fileURL)
        } catch {
            print(error.localizedDescription)
        }
     }
//    func fetch() -> [Friend] {
//
//             //Прочитать объекты
//             let users = mainRealm.objects(Friend.self)
//
//             print(mainRealm.configuration.fileURL)
//
//             return Array(users)
//         }
//    func delete () {
//        try! mainRealm.write{
//            mainRealm.deleteAll()
//        }
//    }
 }


