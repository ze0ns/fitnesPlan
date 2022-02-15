//
//  PlanDayDB.swift
//  FitnesPlan
//
//  Created by Oschepkov Aleksandr on 04.02.2022.
//


import Foundation
import RealmSwift

class PlanDayDB {

     let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
     lazy var mainRealm = try! Realm(configuration: config)
     var PlanDayLocal: [TrainingPlan] = []
    
    

     func addData(_ planDayLocal: [TrainingPlan]) {

         PlanDayLocal = planDayLocal
        let planDay = TrainingPlan()
        let count = self.PlanDayLocal.count
        var i = 0
         print(count)
        mainRealm.beginWrite()
         while i < count {
             planDay.id = self.PlanDayLocal[i].id
             planDay.exercise = self.PlanDayLocal[i].exercise
             planDay.replay = self.PlanDayLocal[i].replay
             planDay.counter = self.PlanDayLocal[i].counter
             planDay.weight = self.PlanDayLocal[i].weight


             mainRealm.add(planDayLocal)

             i = i + 1
          }

        do {
            try mainRealm.commitWrite()
            print(mainRealm.configuration.fileURL as Any)
        } catch {
            print(error.localizedDescription)
        }
     }
    func fetch() -> [TrainingPlan] {
             //Прочитать объекты
             print(mainRealm.configuration.fileURL as Any)
             let users = mainRealm.objects(TrainingPlan.self)
             return Array(users)
         }
    func delete () {
        try! mainRealm.write{
            mainRealm.deleteAll()
        }
    }
 }


