//
//  NavigationRoutingView.swift
//  LMessenger
//
//  Created by 최낙주 on 4/28/24.
//

import SwiftUI

struct NavigationRoutingView: View {
    @State var destination: NavigationDestination
    
    var body: some View {
        switch destination {
        case .chat:
            ChatView()
        case .search:
            SearchView()
        }
    }
}
