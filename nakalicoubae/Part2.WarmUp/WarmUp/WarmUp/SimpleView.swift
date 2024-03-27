//
//  SimpleView.swift
//  WarmUp
//
//  Created by 최낙주 on 3/27/24.
//

import SwiftUI

struct SimpleView: View {
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "pencil")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Text("헤드라인 입니다")
                .font(.headline)
            Text("서브헤드라인 입니다")
                .font(.subheadline)
            Text("바디 입니다")
                .font(.body)
            Button {
                
            } label: {
                Text("Click Me")
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.buttonBorder)
            }
        }
    }
}

#Preview {
    SimpleView()
}
