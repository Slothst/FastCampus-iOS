//
//  FavoriteViewController.swift
//  KTV
//
//  Created by 최낙주 on 4/2/24.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let viewModel: FavoriteViewModel = .init()
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(
            UINib(nibName: "VideoListItemCell", bundle: nil),
            forCellReuseIdentifier: VideoListItemCell.identifier
        )
        self.viewModel.dataChanged = { [weak self] in
            self?.tableView.reloadData()
        }
        self.viewModel.request()
    }
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        VideoListItemCell.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.favorite?.list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: VideoListItemCell.identifier,
            for: indexPath
        ) as? VideoListItemCell else {
            return UITableViewCell()
        }
        if let data = self.viewModel.favorite?.list[indexPath.row] {
            cell.setData(data, rank: nil)
            cell.setLeading(21)
        }
        return cell
    }
}
