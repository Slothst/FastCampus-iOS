//
//  SecondView.swift
//  EnvironmentObjTest
//
//  Created by 최낙주 on 3/18/24.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        VStack(spacing: 30) {
            NavigationLink {
                ThirdView()
            } label: {
                Text("Third View")
            }
        }
        .navigationTitle("Second View")
    }
}

#Preview {
    SecondView()
}
