//
//  VideoViewControllerContainer.swift
//  KTV
//
//  Created by 최낙주 on 4/22/24.
//

import Foundation

protocol VideoViewControllerContainer {
    var videoViewController: VideoViewController { get }
    func presentCurrentViewController()
}
