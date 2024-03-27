//
//  ProfileDetailViewController.swift
//  MyUIKit
//
//  Created by 최낙주 on 3/27/24.
//

import UIKit

class ProfileDetailViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var inputText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = inputText
    }
    
}
