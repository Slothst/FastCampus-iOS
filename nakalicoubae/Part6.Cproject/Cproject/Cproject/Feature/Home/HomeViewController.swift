//
//  HomeViewController.swift
//  Cproject
//
//  Created by 최낙주 on 5/22/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    enum Section: Int {
        case banner
        case horizontalProductItem
    }

    @IBOutlet weak var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, AnyHashable>?
    private var compositionalLayout: UICollectionViewCompositionalLayout = {
        UICollectionViewCompositionalLayout { section, _ in
            switch Section(rawValue: section) {
            case .banner:
                let itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(165 / 393))
                let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging
                return section
                
            case .horizontalProductItem:
                let itemSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item: NSCollectionLayoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize: NSCollectionLayoutSize = NSCollectionLayoutSize(widthDimension: .absolute(117), heightDimension: .estimated(224))
                let group: NSCollectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section: NSCollectionLayoutSection = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 20, leading: 33, bottom: 0, trailing: 33)
                return section
            case .none:
                return nil
            }
        }
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, viewModel in
            switch Section(rawValue: indexPath.section) {
            case .banner:
                guard let viewModel = viewModel as? HomeBannerCollectionViewCellViewModel,
                      let cell: HomeBannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeBannerCollectionViewCell", for: indexPath) as? HomeBannerCollectionViewCell else { return .init() }
                
                cell.setViewModel(viewModel)
                return cell
                
            case .horizontalProductItem:
                guard let viewModel = viewModel as? HomeProductCollectionViewCellViewModel,
                      let cell: HomeProductCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeProductCollectionViewCell", for: indexPath) as? HomeProductCollectionViewCell else { return .init() }
                
                cell.setViewModel(viewModel)
                return cell
                
            case .none:
                return .init()
            }
            
        })
        
        var snapshot: NSDiffableDataSourceSnapshot<Section, AnyHashable> = NSDiffableDataSourceSnapshot<Section, AnyHashable>()
        snapshot.appendSections([.banner])
        snapshot.appendItems([
            HomeBannerCollectionViewCellViewModel(bannerImage: UIImage.slide1),
            HomeBannerCollectionViewCellViewModel(bannerImage: UIImage.slide2),
            HomeBannerCollectionViewCellViewModel(bannerImage: UIImage.slide3)
        ], toSection: .banner)
        
        snapshot.appendSections([.horizontalProductItem])
        snapshot.appendItems([
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "playstation1", reasonDiscountString: "쿠폰 할인", originalPrice: "100,000", discountPrice: "80,000"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "playstation2", reasonDiscountString: "쿠폰 할인", originalPrice: "200,000", discountPrice: "10,000"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "playstation3", reasonDiscountString: "쿠폰 할인", originalPrice: "300,000", discountPrice: "20,000"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "playstation4", reasonDiscountString: "쿠폰 할인", originalPrice: "400,000", discountPrice: "30,000"),
            HomeProductCollectionViewCellViewModel(imageUrlString: "", title: "playstation5", reasonDiscountString: "쿠폰 할인", originalPrice: "500,000", discountPrice: "40,000")
        ], toSection: .horizontalProductItem)
        dataSource?.apply(snapshot)
        
        collectionView.collectionViewLayout = compositionalLayout
    }
}

#Preview {
    UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as! HomeViewController
}
