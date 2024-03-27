//
//  Detail.swift
//  WarmUp
//
//  Created by 최낙주 on 3/27/24.
//

import SwiftUI

struct Detail: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        Text("모달 페이지입니다 2")
        Button {
            isPresented = false
        } label: {
            Text("닫기")
        }

    }
}

#Preview {
    Detail(isPresented: .constant(false))
}
