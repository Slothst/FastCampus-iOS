//
//  ButtonView.swift
//  SwiftUI-Basic
//
//  Created by 최낙주 on 3/16/24.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        Button {
            print("button tapped")
        } label: {
            Text("Click Me")
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundStyle(.white)
        }
        .padding()
        .frame(height: 100)
        .background(.pink)
//        .clipShape(.buttonBorder)
        .cornerRadius(20)
    }
}

#Preview {
    ButtonView()
}
