//
//  TestViewController.swift
//  FitnesPlan
//
//  Created by Oschepkov Aleksandr on 30.01.2022.
//
import Strapi_iOS
import UIKit
import SDWebImage

class ExerciseViewController: UIViewController {
    
    let exerciseAPI = ExerciseAPI()
    let exerciseDB  = ExerciseDB()
    var exercise: [ExerciseProfiles] = []
    var exerciseLocalDB: [ExerciseProfiles] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exerciseAPI.getExercise{[weak self]  users in
        self?.exercise = users!
        }
    }
  
    @IBAction func writeDataToDB(_ sender: Any) {

    }
    @IBAction func readDataFromDB(_ sender: Any) {

    }
    @IBAction func deletaAllDB(_ sender: Any) {

    }
}

