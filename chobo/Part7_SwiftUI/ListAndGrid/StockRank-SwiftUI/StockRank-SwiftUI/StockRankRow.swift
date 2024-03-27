//
//  StockRankRow.swift
//  StockRank-SwiftUI
//
//  Created by 최낙주 on 3/18/24.
//

import SwiftUI

struct StockRankRow: View {
    
    var stock: StockModel
    
    var body: some View {
        HStack {
            Text("\(stock.rank)")
                .font(.system(size: 16, weight: .bold))
                .frame(width: 30)
                .foregroundColor(.blue)
            Image("\(stock.imageName)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            VStack(alignment: .leading, spacing: 5) {
                Text("\(stock.name)")
                    .font(.system(size: 12))
                
                HStack {
                    Text("\(stock.price)")
                        .font(.system(size: 12))
                        .foregroundStyle(.gray)
                    Text("\(stock.diff, specifier: "%.2f")  %")
                        .font(.system(size: 12))
                        .foregroundStyle(stock.diff > 0 ? .red : .blue)
                }
            }
            Spacer()
            Image(systemName: "heart.fill")
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40)
                .foregroundStyle(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    StockRankRow(stock: StockModel.list[2])
}
