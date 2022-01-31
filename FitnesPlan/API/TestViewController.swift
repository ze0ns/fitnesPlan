//
//  TestViewController.swift
//  FitnesPlan
//
//  Created by Oschepkov Aleksandr on 30.01.2022.
//
import Strapi_iOS
import UIKit

class TestViewController: UIViewController {
    let strapi = Strapi.shared
    var token: String? = nil
    var data: Data?
//    var plans: [TrainingsValue] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Новый контроллер, проверка ключа")
        token = String(describing: Session.shared.userProfile["jwt"]!)
        
        strapi.scheme = "https"
        strapi.host = "fitness.zeons.ru"
        strapi.port = 443
        strapi.token = token
        print(Session.shared.token)
        // Do any additional setup after loading the view.
        
        let request = Request(
            method: "GET",
            contentType: "exercises" // You can use any route here
//            parameters: [
//                "price_eq": 3
//            ]
        )
        strapi.exec(request: request, needAuthentication: true) { response in
            guard let data = response.data as? [String: Any]  else {
                print("Не смог инициировать переменную")
                return
            }
        print(data)
        }
        
    }
    


}
