//
//  HomeViewController.swift
//  Cproject
//
//  Created by 최낙주 on 5/22/24.
//

import Combine
import UIKit

class HomeViewController: UIViewController {
    
    enum Section: Int {
        case banner
        case horizontalProductItem
        case verticalProductItem
    }

    @IBOutlet weak var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, AnyHashable>?
    private var compositionalLayout: UICollectionViewCompositionalLayout = setCompositionalLayout()
    private var viewModel: HomeViewModel = HomeViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindingViewModel()
        viewModel.loadData()
        setDataSource()
        collectionView.collectionViewLayout = compositionalLayout
    }
    
    private static func setCompositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            switch Section(rawValue: section) {
            case .banner:
                return HomeBannerCollectionViewCell.bannerLayout()
                
            case .horizontalProductItem:
                return HomeProductCollectionViewCell.horizontalProductItemLayout()
                
            case .verticalProductItem:
                return HomeProductCollectionViewCell.verticalProductItemLayout()
                
            case .none:
                return nil
            }
        }
    }
    
    private func bindingViewModel() {
        viewModel.$bannerViewModels.receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.applySnapshot()
            }.store(in: &cancellables)
        
        viewModel.$horizontalProductViewModels.receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.applySnapshot()
            }.store(in: &cancellables)
        
        viewModel.$verticalProductViewModels.receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.applySnapshot()
            }.store(in: &cancellables)
    }
    
    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { [weak self] collectionView, indexPath, viewModel in
            switch Section(rawValue: indexPath.section) {
            case .banner:
                return self?.bannerCell(collectionView, indexPath, viewModel)
                
            case .horizontalProductItem, .verticalProductItem:
                return self?.productItemCell(collectionView, indexPath, viewModel)
                
            case .none:
                return .init()
            }
        })
    }
    
    private func applySnapshot() {
        var snapshot: NSDiffableDataSourceSnapshot<Section, AnyHashable> = NSDiffableDataSourceSnapshot<Section, AnyHashable>()
        if let bannerViewModels = viewModel.bannerViewModels {
            snapshot.appendSections([.banner])
            snapshot.appendItems(bannerViewModels, toSection: .banner)
        }
        
        if let horizontalProductViewModels = viewModel.horizontalProductViewModels {
            snapshot.appendSections([.horizontalProductItem])
            snapshot.appendItems(horizontalProductViewModels, toSection: .horizontalProductItem)
        }
        
        if let verticalProductViewModels = viewModel.verticalProductViewModels {
            snapshot.appendSections([.verticalProductItem])
            snapshot.appendItems(verticalProductViewModels, toSection: .verticalProductItem)
        }
        dataSource?.apply(snapshot)
    }
    
    private func bannerCell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ viewModel: AnyHashable) -> UICollectionViewCell {
        guard let viewModel = viewModel as? HomeBannerCollectionViewCellViewModel,
              let cell: HomeBannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeBannerCollectionViewCell", for: indexPath) as? HomeBannerCollectionViewCell else { return .init() }
        
        cell.setViewModel(viewModel)
        return cell
    }
    
    private func productItemCell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ viewModel: AnyHashable) -> UICollectionViewCell {
        guard let viewModel = viewModel as? HomeProductCollectionViewCellViewModel,
              let cell: HomeProductCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeProductCollectionViewCell", for: indexPath) as? HomeProductCollectionViewCell else { return .init() }
        
        cell.setViewModel(viewModel)
        return cell
    }
}

#Preview {
    UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as! HomeViewController
}
