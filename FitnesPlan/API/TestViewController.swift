//
//  TestViewController.swift
//  FitnesPlan
//
//  Created by Oschepkov Aleksandr on 30.01.2022.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Новый контроллер, проверка ключа")
        print(Session.shared.userProfile)
        // Do any additional setup after loading the view.
    }
    


}
