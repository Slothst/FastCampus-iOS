//
//  DetailPurchaseView.swift
//  Cproject
//
//  Created by 최낙주 on 5/27/24.
//

import SwiftUI

final class DetailPurchaseViewModel: ObservableObject {
    init(isFavorite: Bool) {
        self.isFavorite = isFavorite
    }
    
    @Published var isFavorite: Bool
}

struct DetailPurchaseView: View {
    @ObservedObject var viewModel: DetailPurchaseViewModel
    var onFavoriteTapped: () -> Void
    var onPurchaseTapped: () -> Void
    
    var body: some View {
        HStack(spacing: 30) {
            Button {
                onFavoriteTapped()
            } label: {
                viewModel.isFavorite ? Image(.favoriteOn) : Image(.favoriteOff)
            }
            
            Button {
                onPurchaseTapped()
            } label: {
                Text("구매하기")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(Color.wh)
            }
            .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
            .background(Color.keyColorBlue)
            .clipShape(RoundedRectangle(cornerRadius: 5))
        }
        .padding(.top, 10)
        .padding(.horizontal, 25)
    }
}

#Preview {
    DetailPurchaseView(viewModel: .init(isFavorite: true), onFavoriteTapped: {}, onPurchaseTapped: {})
}
