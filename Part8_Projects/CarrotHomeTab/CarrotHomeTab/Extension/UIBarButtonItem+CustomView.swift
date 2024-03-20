//
//  UIBarButtonItem+CustomView.swift
//  CarrotHomeTab
//
//  Created by 최낙주 on 3/20/24.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    static func generate(with config: CustomBarItemConfiguration, width: CGFloat? = nil) -> UIBarButtonItem {
        let customView = CustomBarItem(config: config)
        
        if let width = width {
            NSLayoutConstraint.activate([
                customView.widthAnchor.constraint(equalToConstant: width)
            ])
        }
        
        let barbuttonItem = UIBarButtonItem(customView: customView)
        return barbuttonItem
    }
}
