//
//  NavigationController.swift
//  KTV
//
//  Created by 최낙주 on 4/2/24.
//

import UIKit

class NavigationController: UINavigationController {
    
    override var childForStatusBarStyle: UIViewController? {
        self.topViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
