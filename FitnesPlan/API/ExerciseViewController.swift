//
//  TestViewController.swift
//  FitnesPlan
//
//  Created by Oschepkov Aleksandr on 30.01.2022.
//
import Strapi_iOS
import UIKit

class ExerciseViewController: UIViewController {
    
    let exerciseAPI = ExerciseAPI()
    let exerciseDB  = ExerciseDB()
    var exercise: [ExerciseLocal] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        exerciseAPI.getExercise{[weak self]  users in
        self?.exercise = users!
        }
     
        
    }
  
    @IBAction func writeDataToDB(_ sender: Any) {
        print("Пробуем записать в базу")
        exerciseDB.addData(exercise)
    }
}

