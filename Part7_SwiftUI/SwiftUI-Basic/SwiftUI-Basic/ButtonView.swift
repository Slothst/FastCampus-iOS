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
        }
    }
}

#Preview {
    ButtonView()
}
