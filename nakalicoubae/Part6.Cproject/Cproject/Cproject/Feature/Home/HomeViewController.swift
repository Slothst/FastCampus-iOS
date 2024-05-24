//
//  HomeViewController.swift
//  Cproject
//
//  Created by 최낙주 on 5/22/24.
//

import Combine
import UIKit

final class HomeViewController: UIViewController {
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>
    
    private enum Section: Int {
        case banner
        case horizontalProductItem
        case separateLine1
        case couponButton
        case verticalProductItem
        case separateLine2
    }

    @IBOutlet private weak var collectionView: UICollectionView!
    private lazy var dataSource: DataSource = setDataSource()
    private lazy var compositionalLayout: UICollectionViewCompositionalLayout = setCompositionalLayout()
    private var viewModel: HomeViewModel = HomeViewModel()
    private var cancellables = Set<AnyCancellable>()
    private var currentSection: [Section] {
        dataSource.snapshot().sectionIdentifiers as [Section]
    }
    private var didTapCouponDownload: PassthroughSubject<Void, Never> = PassthroughSubject<Void, Never>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindingViewModel()
        collectionView.collectionViewLayout = compositionalLayout
        
        viewModel.process(action: .loadData)
        viewModel.process(action: .loadCoupon)
    }
    
    private func setCompositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] section, _ in
            switch self?.currentSection[section] {
            case .banner:
                return HomeBannerCollectionViewCell.bannerLayout()
                
            case .horizontalProductItem:
                return HomeProductCollectionViewCell.horizontalProductItemLayout()
                
            case .verticalProductItem:
                return HomeProductCollectionViewCell.verticalProductItemLayout()
                
            case .couponButton:
                return HomeCouponButtonCollectionViewCell.couponButtonItemLayout()
                
            case .separateLine1, .separateLine2:
                return HomeSeparateLineCollectionViewCell.separateLineLayout()
                
            case .none:
                return nil
            }
        }
    }
    
    private func bindingViewModel() {
        viewModel.state.$collectionViewModels.receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.applySnapshot()
            }.store(in: &cancellables)
        
        didTapCouponDownload.receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.viewModel.process(action: .didTapCouponButton)
            }.store(in: &cancellables)
    }
    
    private func setDataSource() -> DataSource {
        return UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { [weak self] collectionView, indexPath, viewModel in
            switch self?.currentSection[indexPath.section] {
            case .banner:
                return self?.bannerCell(collectionView, indexPath, viewModel)
                
            case .horizontalProductItem, .verticalProductItem:
                return self?.productItemCell(collectionView, indexPath, viewModel)
                
            case .couponButton:
                return self?.couponButtonCell(collectionView, indexPath, viewModel)
                
            case .separateLine1, .separateLine2:
                return self?.separateLineCell(collectionView, indexPath, viewModel)
                
            case .none:
                return .init()
            }
        })
    }
    
    private func applySnapshot() {
        var snapshot: Snapshot = Snapshot()
        if let bannerViewModels = viewModel.state.collectionViewModels.bannerViewModels {
            snapshot.appendSections([.banner])
            snapshot.appendItems(bannerViewModels, toSection: .banner)
        }
        
        if let horizontalProductViewModels = viewModel.state.collectionViewModels.horizontalProductViewModels {
            snapshot.appendSections([.horizontalProductItem])
            snapshot.appendItems(horizontalProductViewModels, toSection: .horizontalProductItem)
            
            snapshot.appendSections([.separateLine1])
            snapshot.appendItems(viewModel.state.collectionViewModels.separateLine1ViewModels, toSection: .separateLine1)
        }
        
        if let couponViewModels = viewModel.state.collectionViewModels.couponState {
            snapshot.appendSections([.couponButton])
            snapshot.appendItems(couponViewModels, toSection: .couponButton)
        }
        
        if let verticalProductViewModels = viewModel.state.collectionViewModels.verticalProductViewModels {
            snapshot.appendSections([.verticalProductItem])
            snapshot.appendItems(verticalProductViewModels, toSection: .verticalProductItem)
        }
        dataSource.apply(snapshot)
    }
    
    private func bannerCell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ viewModel: AnyHashable) -> UICollectionViewCell {
        guard let viewModel = viewModel as? HomeBannerCollectionViewCellViewModel,
              let cell: HomeBannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeBannerCollectionViewCell.reusableId, for: indexPath) as? HomeBannerCollectionViewCell else { return .init() }
        
        cell.setViewModel(viewModel)
        return cell
    }
    
    private func productItemCell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ viewModel: AnyHashable) -> UICollectionViewCell {
        guard let viewModel = viewModel as? HomeProductCollectionViewCellViewModel,
              let cell: HomeProductCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeProductCollectionViewCell.reusableId, for: indexPath) as? HomeProductCollectionViewCell else { return .init() }
        
        cell.setViewModel(viewModel)
        return cell
    }
    
    private func couponButtonCell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ viewModel: AnyHashable) -> UICollectionViewCell {
        guard let viewModel = viewModel as? HomeCouponButtonCollectionViewCellViewModel,
              let cell: HomeCouponButtonCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCouponButtonCollectionViewCell.reusableId, for: indexPath) as? HomeCouponButtonCollectionViewCell else { return .init() }
        
        cell.setViewModel(viewModel, didTapCouponDownload)
        return cell
    }
    
    private func separateLineCell(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ viewModel: AnyHashable) -> UICollectionViewCell {
        guard let viewModel = viewModel as? HomeSeparateLineCollectionViewCellViewModel,
              let cell: HomeSeparateLineCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSeparateLineCollectionViewCell.reusableId, for: indexPath) as? HomeSeparateLineCollectionViewCell else { return .init() }
        
        cell.setViewModel(viewModel)
        return cell
    }
}

#Preview {
    UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as! HomeViewController
}
