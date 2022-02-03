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
    var planLocal:[ExerciseLocal] = []
    var datas: String = "2022-01-22"
    
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
            contentType: "day?date="+datas // You can use any route here
        )
        strapi.exec(request: request, needAuthentication: true) { response in
            guard let data = response.data else {return}
            self.data = data as? Data
            do{
                print(self.data?.prettyJSON)
                print("Парсим JSON")
                let planJSON = try JSONDecoder().decode([TrainingPlanElement].self, from: self.data!)
                self.plan = planJSON
                print(self.plan)
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
