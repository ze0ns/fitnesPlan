//
//  SaveUserInfoViewController.swift
//  Sport 2022
//
//  Created by Марк Киричко on 07.02.2022.
//

import UIKit
import RealmSwift

class SaveUserInfoViewController: UIViewController {

    
    @IBOutlet weak var WeightTextField: UITextField!
    @IBOutlet weak var ChestDiameterTextField: UITextField!
    @IBOutlet weak var BeltDiameterTextField: UITextField!
    
    let realm = try! Realm()
    public var completionHandlerUser: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()       
    }
    
    @IBAction func Save(_ sender: Any) {
        didTapSaveButton()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @objc func didTapSaveButton() {

            }
}
