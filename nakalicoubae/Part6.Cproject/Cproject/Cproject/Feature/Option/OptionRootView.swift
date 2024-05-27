//
//  OptionRootView.swift
//  Cproject
//
//  Created by 최낙주 on 5/27/24.
//

import SwiftUI

struct OptionRootView: View {
    @ObservedObject var viewModel: OptionViewModel
    
    var body: some View {
        Text("옵션 화면")
    }
}

#Preview {
    OptionRootView(viewModel: .init())
}
