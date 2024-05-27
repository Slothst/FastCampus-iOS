//
//  DetailOptionView.swift
//  Cproject
//
//  Created by 최낙주 on 5/27/24.
//

import SwiftUI
import Kingfisher

final class DetailOptionViewModel: ObservableObject {
    init(type: String, name: String, imageUrl: String) {
        self.type = type
        self.name = name
        self.imageUrl = imageUrl
    }
    
    @Published var type: String
    @Published var name: String
    @Published var imageUrl: String
}

struct DetailOptionView: View {
    @ObservedObject var viewModel: DetailOptionViewModel
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.type)
                    .foregroundStyle(Color.gray5)
                    .font(.system(size: 12, weight: .regular))
                Text(viewModel.name)
                    .foregroundStyle(Color.bk)
                    .font(.system(size: 14, weight: .bold))
            }
            
            Spacer()
            
            KFImage(URL(string: viewModel.imageUrl))
                .resizable()
                .frame(width: 40, height: 40)
        }
    }
}

#Preview {
    DetailOptionView(viewModel: DetailOptionViewModel(
        type: "색상",
        name: "코랄",
        imageUrl: "https://picsum.photos/id/1/500/500"
    ))
}
