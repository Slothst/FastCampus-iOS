//
//  SplashViewController.swift
//  Cproject
//
//  Created by 최낙주 on 5/19/24.
//

import Lottie
import UIKit

class SplashViewController: UIViewController {
    @IBOutlet weak var lottieAnimationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        lottieAnimationView.play()
    }
}
