//
//  OnboardingView.swift
//  WarmUp
//
//  Created by 최낙주 on 3/27/24.
//

import SwiftUI

struct OnboardingView: View {
    
    let onboardingTitle: String
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()
            Text("온보딩1")
        }
    }
}

#Preview {
    OnboardingView(onboardingTitle: "온보딩 테스트", backgroundColor: .blue)
}
