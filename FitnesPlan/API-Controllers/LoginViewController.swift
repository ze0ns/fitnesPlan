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
            identifier: "zeons@mail.ru",
            password: "P@ssw0rd") { response in
                guard let record = response.data as? Data  else {return}
                self.data = record
                
                print("Получили ответ, декодим JSON, присвоили его переменным")

                do{
                    let userProfile = try? JSONDecoder().decode(UserProfile.self, from: self.data!)
                    Session.shared.userProfile = userProfile
                    Session.shared.token = userProfile!.jwt
                    print("Получили токен ")
                    print(Session.shared.token)

                }catch{
                    print("Operations Error")
                    print(error)
                }
                
            }
      
    }
    
 

}
