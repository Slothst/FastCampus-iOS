//
//  MyViewController.swift
//  MyUIKit
//
//  Created by 최낙주 on 3/27/24.
//

import UIKit

class MyViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var helloLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }

    @IBAction func didTabButton(_ sender: Any) {
        helloLabel.text = nameTextField.text
    }
}
