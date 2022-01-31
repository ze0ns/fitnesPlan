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
    var data: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Начало работы программы")
        strapi.scheme = "https"
        strapi.host = "fitness.zeons.ru"
        strapi.port = 443
        
        strapi.login(
            identifier: "fitnes@zeons.ru",
            password: "p@ssw0rd") { response in
          //  guard let record = response.data as? [String: Any] else {return}
                guard let record = response.data  else {return}
                self.data = record as? Data
               // print(self.data?.prettyJSON)
                print("Присваиваем профилю")
                
              //  Session.shared.userProfile = record
                do{
                    let userProfile = try? JSONDecoder().decode(UserProfile.self, from: self.data!)
                    print(userProfile)
                }catch{
                    print("Operations Error")
                    print(error)
                }
                
            }
      
    }
    


}
