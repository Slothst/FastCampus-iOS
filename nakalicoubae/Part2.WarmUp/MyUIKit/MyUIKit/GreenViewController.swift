//
//  GreenViewController.swift
//  MyUIKit
//
//  Created by 최낙주 on 3/27/24.
//

import UIKit

struct People {
    let name: String
    let age: Int
}

class GreenViewController: UIViewController {
    
    var friends: [People] = [
        People(name: "dad", age: 22)
    ]

    @IBOutlet weak var insertNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goNext" { let vc = segue.destination as! IndigoViewController
            vc.inputName = insertNameTextField.text!
            vc.friends = friends
        }
    }
}
