//
//  SplashViewController.swift
//  Cproject
//
//  Created by 최낙주 on 5/19/24.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var appIconCenterXConstaint: NSLayoutConstraint!
    @IBOutlet weak var appIconCenterYConstaint: NSLayoutConstraint!
    @IBOutlet weak var appIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*appIconCenterXConstaint.constant = -(view.frame.width / 2) - (appIcon.frame.width / 2)
        appIconCenterYConstaint.constant = -(view.frame.height / 2) - (appIcon.frame.height / 2)
        
        UIView.animate(withDuration: 1) { [weak self] in
            self?.view.layoutIfNeeded()
        }*/
        
        UIView.animate(withDuration: 3) { [weak self] in
            let rotationAngle: CGFloat = CGFloat.pi
            self?.appIcon.transform = CGAffineTransform(rotationAngle: rotationAngle)
        }
    }
}
