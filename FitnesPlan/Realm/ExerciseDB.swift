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

     let config = Realm.Configuration(schemaVersion: 1)
     lazy var mainRealm = try! Realm(configuration: config)
     var ExerciseLocal: [ExerciseProfiles] = []
    
    

     func addData(_ exerciseLocal: [ExerciseProfiles]) {
        print(mainRealm.configuration.fileURL as Any)
         
        ExerciseLocal = exerciseLocal
        let exercise = ExerciseProfiles()
        let e = self.ExerciseLocal.count
        var i = 0
        mainRealm.beginWrite()
         while i < e {
             exercise.id = self.ExerciseLocal[i].id
             exercise.name = self.ExerciseLocal[i].name
             exercise.movie = self.ExerciseLocal[i].movie

             mainRealm.add(exerciseLocal)

             i = i + 1
          }
         
        do {
            try mainRealm.commitWrite()
            print(mainRealm.configuration.fileURL as Any)
        } catch {
            print(error.localizedDescription)
        }
     }
    func fetch() -> [ExerciseProfiles] {
             //Прочитать объекты
             let users = mainRealm.objects(ExerciseProfiles.self)
             return Array(users)
         }
    func delete () {
        try! mainRealm.write{
            mainRealm.deleteAll()
        }
    }
 }


