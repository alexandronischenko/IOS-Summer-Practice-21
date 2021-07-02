//
//  ViewController.swift
//  Homework2
//
//  Created by Alexandr Onischenko on 01.07.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var loginPlaceHolder: UITextField!
    @IBOutlet weak var passwordPlaceHolder: UITextField!
    
    
   
    let loginSecret: String = "admin"
    let passwordSecret: String = "admin"

    @IBAction func loginButtonAction(_ sender: Any) {
        if loginPlaceHolder.text == loginSecret && passwordPlaceHolder.text == passwordSecret{
            
            guard let contactsViewController = storyboard?.instantiateViewController(withIdentifier: "ContactsViewController") as? ContactsViewController else { return }
            
            navigationController?.pushViewController(contactsViewController , animated: true)
        }
    }
}

