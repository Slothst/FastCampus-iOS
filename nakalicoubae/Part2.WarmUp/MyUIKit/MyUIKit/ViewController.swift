//
//  ViewController.swift
//  MyUIKit
//
//  Created by 최낙주 on 3/27/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
    }

    @IBAction func didMyButtonTapped(_ sender: Any) {
        print("Hello")
        myLabel.text = "Hello"
    }
    
}

