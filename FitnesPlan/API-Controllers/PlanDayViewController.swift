//
//  PlanDayViewController.swift
//  FitnesPlan
//
//  Created by Oschepkov Aleksandr on 31.01.2022.

import Strapi_iOS
import UIKit

class PlanDayViewController: UIViewController {
   
    ///Дата тренировки для запроса на сервер
    var dataPlan: String = "2022-02-06"
    
    let planDayAPI = TrainingPlanApi()
    let planDayDB  = PlanDayDB()
    var planDay: [TrainingPlanElement] = []
    var planDayLocalDB: [TrainingPlanElement] = []
    var createExerciseAPI = CreateExerciseAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        planDayAPI.getPlanDay{[weak self]  users in
        self?.planDay = users!
        }
    }
    
    @IBAction func planDayWriteDB(_ sender: Any) {
        print("Пробуем записать в базу")
        planDayDB.addData(planDay)
    }
    
    @IBAction func planDayReadDB(_ sender: Any) {
        print("Читаем данные из базы")
        planDayLocalDB = planDayDB.fetch()
        print(planDayLocalDB)
    }
    
    @IBAction func createExercises(_ sender: Any) {
        print("Пробуем создать запись")
        createExerciseAPI.createPlan()
    }
}
