//
//  HomeViewController.swift
//  CarrotHomeTab
//
//  Created by 최낙주 on 3/20/24.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    
    let viewModel: HomeViewModel = HomeViewModel(network: NetworkService(configuration: .default))
    var subscriptions = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.fetch()
    }
    
    private func bind() {
        viewModel.$items
            .receive(on: RunLoop.main)
            .sink { items in
                print("--> update collectionView \(items)")
            }.store(in: &subscriptions)
        
        viewModel.itemTapped
            .sink { item in
                let sb = UIStoryboard(name: "Detail", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }.store(in: &subscriptions)
    }
}
