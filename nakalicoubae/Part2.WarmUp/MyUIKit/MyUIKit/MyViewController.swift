//
//  MyViewController.swift
//  MyUIKit
//
//  Created by 최낙주 on 3/27/24.
//

import UIKit

protocol AdminDelegate {
    func doTask()
}

class MyViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var helloLabel: UILabel!
    
    var admin: Admin?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        admin = Admin(delegate: self)
    }

    @IBAction func didTabButton(_ sender: Any) {
        helloLabel.text = nameTextField.text
        admin?.delegate.doTask()
    }
}

extension MyViewController: AdminDelegate {
    func doTask() {
        print("do task")
    }
}

struct Admin {
    var delegate: AdminDelegate
}
