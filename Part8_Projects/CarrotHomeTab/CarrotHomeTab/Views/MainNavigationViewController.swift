//
//  MainNavigationViewController.swift
//  CarrotHomeTab
//
//  Created by 최낙주 on 3/20/24.
//

import UIKit

class MainNavigationViewController: UINavigationController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let backImage = UIImage(systemName: "arrow.backward")
        navigationBar.backIndicatorImage = backImage
        navigationBar.backIndicatorTransitionMaskImage = backImage
        navigationBar.tintColor = .white
    }
}
