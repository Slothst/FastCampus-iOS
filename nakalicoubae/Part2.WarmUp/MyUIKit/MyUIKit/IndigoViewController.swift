//
//  IndigoViewController.swift
//  MyUIKit
//
//  Created by 최낙주 on 3/27/24.
//

import UIKit

class IndigoViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    var inputName: String = ""
    var friends: [People] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = friends.first?.name
    }
}
