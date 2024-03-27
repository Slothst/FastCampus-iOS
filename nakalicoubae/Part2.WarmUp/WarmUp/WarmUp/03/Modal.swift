//
//  Modal.swift
//  WarmUp
//
//  Created by 최낙주 on 3/27/24.
//

import SwiftUI

struct Modal: View {
    
    @State var showModal: Bool = false
    
    var body: some View {
        VStack {
            Text("메일 페이지 입니다")
            Button {
                showModal = true
            } label: {
                Text("Modal 화면 전환")
            }
        }
        .sheet(isPresented: $showModal, content: {
            Detail(isPresented: $showModal)
        })
    }
}

#Preview {
    Modal()
}
