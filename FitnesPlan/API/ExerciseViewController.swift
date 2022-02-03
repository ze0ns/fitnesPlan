//
//  TestViewController.swift
//  FitnesPlan
//
//  Created by Oschepkov Aleksandr on 30.01.2022.
//
import Strapi_iOS
import UIKit

class ExerciseViewController: UIViewController {
    let strapi = Strapi.shared
    var token: String? = nil
    var data: Data?
    var exercise: [Exercise] = []
    var exerciseLocal:[ExerciseLocal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Список упражнений")

        token = Session.shared.token
        strapi.scheme = "https"
        strapi.host = "fitness.zeons.ru"
        strapi.port = 443
        strapi.token = token
 
        let request = Request(
            method: "GET",
            contentType: "exercises" // You can use any route here
        )
        strapi.exec(request: request, needAuthentication: true) { response in
            guard let data = response.data else {return}
            self.data = data as? Data
            do{
              //  print(self.data?.prettyJSON)
                print("Парсим JSON упражнений")
                let exerciseJSON = try JSONDecoder().decode([Exercise].self, from: self.data!)
                self.exercise = exerciseJSON
                let count = self.exercise.count - 1
                var n = 0
                for _ in 0 ... count {
                    self.exerciseLocal.append(ExerciseLocal(id: self.exercise[n].id, name: self.exercise[n].name, exerciseDescription: self.exercise[n].exerciseDescription, movie: self.exercise[n].movie) )
                    n = n + 1
                }
                print(self.exerciseLocal)
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
