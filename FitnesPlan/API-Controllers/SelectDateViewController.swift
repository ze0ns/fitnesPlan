//
//  SelectDateViewController.swift
//  FitnesPlan
//
//  Created by Oschepkov Aleksandr on 05.02.2022.
//

import UIKit
import CalendarSwift

class SelectDateViewController: UIViewController,CalendarViewDelegate {
    ///Дата тренировки для запроса на сервер
    
    let exerciseDB  = ExerciseDB()
    let planDayAPI = TrainingPlanApi()
    let planDayDB  = PlanDayDB()
    var planDay: [TrainingPlanElement] = []
    var planDayLocalDB: [TrainingPlanElement] = []
    var createExerciseAPI = CreateExerciseAPI()
    
    @IBOutlet weak var calendarView: CalendarView!
    
    @IBAction func loadPlan(_ sender: Any) {
        planDayAPI.getPlanDay{[weak self]  users in
        self?.planDay = users!
        }
        exerciseDB.delete()
        print("Дата")
        print(Session.shared.date)
        print("Пробуем записать в базу")
        planDayDB.addData(planDay)
    }
    
    @IBAction func beginTraning(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        
        self.calendarView.style.language = "ru"
        self.calendarView.delegate = self
        self.calendarView.setupCalendar()
        self.calendarView.selectedYearDelay = 0.3
        

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func calendarDateChanged(date: Date) {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd" // Устанавливаем формат даты
        Session.shared.date = dateFormatter.string(from: date) // Конвертируем в строку
        print(Session.shared.date)
        
    }

    
    
}
