//
//  TrainingPlanApi.swift
//  FitnesPlan
//
//  Created by Oschepkov Aleksandr on 04.02.2022.
//

import Strapi_iOS
import Foundation

final class TrainingPlanApi{
    ///Дата тренировки для запроса на сервер
    var dataPlan: String = "2022-02-06"
    var token = Session.shared.token
    var data: Data?
    var exercise: [TrainingPlanElement] = []
    
    func getPlanDay(comletion: @escaping(([TrainingPlanElement]?)->())){
        let strapi = Strapi.shared
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
    //        print(self.data?.prettyJSON)
            print("Парсим JSON упражнений")
            
            let trainingPlanJSON = try JSONDecoder().decode([TrainingPlanElement].self, from: self.data!)
            print(trainingPlanJSON.count)
            comletion(trainingPlanJSON)
            
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


