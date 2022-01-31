//
//  Exercises.swift
//  FitnesPlan
//
//  Created by Oschepkov Aleksandr on 31.01.2022.
//

import Foundation
import Strapi_iOS


class Exercises: UIViewController{
    
    let strapi = Strapi.shared
    var token: String? = nil
    
    override func viewDidLoad() {
        token = String(describing: Session.shared.userProfile["jwt"]!)
        strapi.scheme = "https"
        strapi.host = "fitness.zeons.ru"
        strapi.port = 443
        strapi.token = token
        

    }
    
}
