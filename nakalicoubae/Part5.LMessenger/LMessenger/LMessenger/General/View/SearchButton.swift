//
//  SearchButton.swift
//  LMessenger
//
//  Created by 최낙주 on 4/28/24.
//

import SwiftUI

struct SearchButton: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 36)
                .background(Color.greyCool)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
            HStack {
                Text("검색")
                    .font(.system(size: 12))
                    .foregroundStyle(Color.greyLightVer2)
                Spacer()
            }
            .padding(.leading, 22)
        }
        .padding(.horizontal, 30)
    }
}

#Preview {
    SearchButton()
}
