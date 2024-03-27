//
//  Navigation.swift
//  WarmUp
//
//  Created by 최낙주 on 3/27/24.
//

import SwiftUI

struct Navigation: View {
    
    let titles = ["디테일뷰로 이동하기1", "디테일뷰로 이동하기2"]
    let descriptions = ["데스티네이션입니다.", "데스티네이션입니다.2"]
    
    @State var showModal: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach([0, 1], id: \.self) { index in
                    NavigationLink {
                        Text(descriptions[index])
                    } label: {
                        Text(titles[index])
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        showModal = true
                    } label: {
                        Text("add")
                    }
                }
            }
            .sheet(isPresented: $showModal, content: {
                Text("아이템 추가 페이지입니다.")
            })
            .navigationTitle("네비게이션")
        }
    }
}

#Preview {
    Navigation()
}
