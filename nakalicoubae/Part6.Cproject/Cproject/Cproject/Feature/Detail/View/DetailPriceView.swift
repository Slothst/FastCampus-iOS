//
//  DetailPriceView.swift
//  Cproject
//
//  Created by 최낙주 on 5/27/24.
//

import SwiftUI

final class DetailPriceViewModel: ObservableObject {
    init(discountRate: String, originPrice: String, currentPrice: String, shippingType: String) {
        self.discountRate = discountRate
        self.originPrice = originPrice
        self.currentPrice = currentPrice
        self.shippingType = shippingType
    }
    
    @Published var discountRate: String
    @Published var originPrice: String
    @Published var currentPrice: String
    @Published var shippingType: String
}

struct DetailPriceView: View {
    @ObservedObject var viewModel: DetailPriceViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 21) {
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 0) {
                    Text(viewModel.discountRate)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(Color.icon)
                    Text(viewModel.originPrice)
                        .font(.system(size: 16, weight: .bold))
                        .strikethrough()
                        .foregroundStyle(Color.gray5)
                }
                Text(viewModel.currentPrice)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Color.keyColorRed)
            }
            Text(viewModel.shippingType)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(Color.icon)
        }
    }
}

#Preview {
    DetailPriceView(viewModel: .init(
        discountRate: "53%",
        originPrice: "300,000원",
        currentPrice: "139,000원",
        shippingType: "무료배송"
    ))
}
