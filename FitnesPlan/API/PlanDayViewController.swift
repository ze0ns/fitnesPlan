//
//  PlanDayViewController.swift
//  FitnesPlan
//
//  Created by Oschepkov Aleksandr on 31.01.2022.

import Strapi_iOS
import UIKit

class PlanDayViewController: UIViewController {
    let strapi = Strapi.shared
    var token: String? = nil
    var data: Data?
    var plan: [TrainingPlanElement] = []
    var planLocal:[TrainingPlanLocal] = []
    
   
    ///Дата тренировки для запроса на сервер
    var dataPlan: String = "2022-02-06"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Новый контроллер, проверка ключа")

        token = Session.shared.token
        strapi.scheme = "https"
        strapi.host = "fitness.zeons.ru"
        strapi.port = 443
        strapi.token = token
 
        let request = Request(
            method: "GET",
            contentType: "day?date="+dataPlan // You can use any route here
        )
        strapi.exec(request: request, needAuthentication: true) { response in
            guard let data = response.data else {return}
            self.data = data as? Data
            do{
               // print(self.data?.prettyJSON)
                print("Парсим JSON")
                let planJSON = try JSONDecoder().decode([TrainingPlanElement].self, from: self.data!)
                self.plan = planJSON
                print(self.plan.count)
                let count = self.plan.count - 1
                var n = 0
                for _ in 0 ... count {
                    self.planLocal.append(TrainingPlanLocal(id: self.plan[n].id, replay: self.plan[n].replay, trainingPlanDescription: self.plan[n].trainingPlanDescription, exercise: self.plan[n].exercise.id, weight: self.plan[n].weight, date: self.plan[n].date, counter: self.plan[n].counter))
                n = n + 1
                }
                
                print("Загрузили план тренировок локально")
                print(self.planLocal)
            } catch DecodingError.keyNotFound(let key, let context) {
                Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
            } catch DecodingError.valueNotFound(let type, let context) {
                Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.typeMismatch(let type, let context) {
                Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.dataCorrupted(let context) {
                Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
            } catch let error as NSError {
                NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
            }
        }
        
    }
    


}
