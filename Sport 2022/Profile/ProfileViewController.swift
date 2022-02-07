//
//  ProfileViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 07.02.2022.
//

import UIKit
import RealmSwift

class ProfileViewController: UIViewController {

    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var Email: UILabel!
    @IBOutlet weak var Birthday: UILabel!
    @IBOutlet weak var ChestDiameter: UILabel!
    @IBOutlet weak var BeltDiameter: UILabel!
    
    let realm = try! Realm()
    
    var user: Array<User> = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    
    func loadData() {
            do {
                let realm = try Realm()

                let userinfo = realm.objects(User.self)

                self.user = Array(userinfo)

                for person in user {
                    let firstname = person.name 
                    let email = person.email
                    let birthday = person.birthday
                    
                    UserName.text = firstname
                    Email.text = email
                    Birthday.text = ("Д.Р. : \(birthday)")
//                    ChestDiameter.text = String(chest)
//                    BeltDiameter.text = String(belt)
                }
            } catch {
                // если произошла ошибка, выводим ее в консоль
                print(error)
            }
        }
 }
