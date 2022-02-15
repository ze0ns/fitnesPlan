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
            password: "ao3011osh") { response in
                guard let record = response.data as? Data  else {return}
                self.data = record
                
                print("Получили ответ, декодим JSON, присвоили его переменным")
                //print(self.data?.prettyJSON)
                do{
                    let userProfile = try JSONDecoder().decode(UserProfile.self, from: self.data!)
                    Session.shared.userProfile = userProfile
                    Session.shared.token = userProfile.jwt
                    print("Получили токен ")
                    print(Session.shared.token)

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
