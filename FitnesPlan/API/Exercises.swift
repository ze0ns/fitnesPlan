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

    
    override func viewDidLoad() {
        strapi.scheme = "https"
        strapi.host = "fitness.zeons.ru"
        strapi.port = 443
        

        
    }
    
}
