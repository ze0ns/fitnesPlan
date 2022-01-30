//
//  LoginViewController.swift
//  FitnesPlan
//
//  Created by Oschepkov Aleksandr on 30.01.2022.
//
import Strapi_iOS
import UIKit

class LoginViewController: UIViewController {
    let strapi = Strapi.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Начало работы программы")
        strapi.scheme = "https"
        strapi.host = "fitness.zeons.ru"
        strapi.port = 443
        
        strapi.login(
            identifier: "fitnes@zeons.ru",
            password: "p@ssw0rd") { response in
            guard let record = response.data as? [String: Any] else {return}

                print("Присваиваем профилю")
                Session.shared.userProfile = record
            }
      
    }
    


}
