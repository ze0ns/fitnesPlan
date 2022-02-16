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

    
    let realm = try! Realm()
    
    var user: Array<User> = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    
    func loadData() {

        }
 }
