//
//  DetailViewModel.swift
//  Cproject
//
//  Created by 최낙주 on 5/27/24.
//

import Foundation

final class DetailViewModel: ObservableObject {
    struct State {
        var isLoading: Bool = false
        var banners: DetailBannerViewModel?
        var rate: DetailRateViewModel?
        var title: String?
        var option: DetailOptionViewModel?
        var price: DetailPriceViewModel?
        var mainImageUrls: [String]?
        var more: DetailMoreViewModel?
        var purchase: DetailPurchaseViewModel?
    }
    
    enum Action {
        case loadData
        case loading(Bool)
        case getDataSuccess(ProductDetailResponse)
        case getDataFailure(Error)
        case didTapChangeOption
        case didTapMore
        case didTapFavorite
        case didTapPurchase
    }
    
    @Published private(set) var state: State = State()
    private var loadDataTask: Task<Void, Never>?
    private var isFavorite: Bool = false
    private var needShowMore: Bool = true
    
    func process(_ action: Action) {
        switch action {
        case .loadData:
            loadData()
        case let .loading(isLoading):
            state.isLoading = isLoading
        case let .getDataSuccess(response):
            Task { await transformProductDetailResponse(response) }
        case let .getDataFailure(error):
            print(error)
        case .didTapChangeOption:
            break
        case .didTapMore:
            needShowMore = false
            state.more = needShowMore ? DetailMoreViewModel() : nil
        case .didTapFavorite:
            isFavorite.toggle()
            state.purchase = DetailPurchaseViewModel(isFavorite: isFavorite)
        case .didTapPurchase:
            break
        }
    }
    
    deinit {
        loadDataTask?.cancel()
    }
}

extension DetailViewModel {
    private func loadData() {
        loadDataTask = Task {
            defer {
                process(.loading(false))
            }
            do {
                process(.loading(true))
                let response = try await NetworkService.shared.getProductDetailData()
                process(.getDataSuccess(response))
            } catch {
                process(.getDataFailure(error))
                
            }
        }
    }
    
    @MainActor
    private func transformProductDetailResponse(_ response: ProductDetailResponse) async {
        state.banners = DetailBannerViewModel(imageUrls: response.bannerImages)
        state.rate = DetailRateViewModel(rate: response.product.rate)
        state.title = response.product.name
        state.option = DetailOptionViewModel(
            type: response.option.type,
            name: response.option.name,
            imageUrl: response.option.image
        )
        state.price = DetailPriceViewModel(
            discountRate: "\(response.product.discountPercent)%",
            originPrice: response.product.originalPrice.moneyString,
            currentPrice: response.product.discountPrice.moneyString,
            shippingType: "무료배송"
        )
        state.mainImageUrls = response.detailImages
        state.more = needShowMore ? DetailMoreViewModel() : nil
        state.purchase = DetailPurchaseViewModel(isFavorite: isFavorite)
    }
}
