//
//  TabDetail.swift
//  WarmUp
//
//  Created by 최낙주 on 3/27/24.
//

import SwiftUI

struct TabDetail: View {
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            Text("this is detail")
        }
    }
}

struct TabDetail2: View {
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack {
                Text("this is detail")
                Button {
                    
                } label: {
                    Text("Continue")
                        .padding()
                        .background(.green)
                        .clipShape(.rect(cornerRadius: 10))
                }

            }
        }
    }
}

struct TabDetail3: View {
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            Text("this is detail3")
        }
    }
}

#Preview {
    TabDetail()
}
