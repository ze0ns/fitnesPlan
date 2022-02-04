//
//  CreateExerciseAPI.swift
//  FitnesPlan
//
//  Created by Oschepkov Aleksandr on 04.02.2022.
//

import Foundation
import Strapi_iOS


final class CreateExerciseAPI{
    var data: Data?
    var token = Session.shared.token
  
//    var exercise: [ExerciseProfiles] = []
    
    func createPlan(){
        let strapi = Strapi.shared
        strapi.scheme = "https"
        strapi.host = "fitness.zeons.ru"
        strapi.port = 443
        strapi.token = token
    
        let request = CreateRequest(
            contentType: "plan",
            parameters: [
                "date": "2022-02-01",
                "exercise": ["id": 3],
                "replay": 8,
                "counter": 3,
                "weight": 70,
                "description": "Тренировка 1",
                "analize": "fact",
            ]
        )
        print(request)
        strapi.exec(request: request, needAuthentication: true) { response in
            guard let data = response.data as? Data
                else {
                    print("Ничего не получилось ")
                    return
            }
            print(data.prettyJSON)
            print("Получилось")
           
        }
    
   }
}
