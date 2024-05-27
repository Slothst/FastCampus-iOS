//
//  DetailMoreView.swift
//  Cproject
//
//  Created by 최낙주 on 5/27/24.
//

import SwiftUI

final class DetailMoreViewModel: ObservableObject {
}

struct DetailMoreView: View {
    @ObservedObject var viewModel: DetailMoreViewModel
    var onMoreTapped: () -> Void
    
    var body: some View {
        Button {
            onMoreTapped()
        } label: {
            HStack(alignment: .center, spacing: 10) {
                Text("상품정보 더보기")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(Color.keyColorBlue)
                Image(.down)
                    .foregroundStyle(Color.icon)
            }
            .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
            .border(Color.keyColorBlue, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    DetailMoreView(viewModel: .init(), onMoreTapped: {})
}
