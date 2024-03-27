//
//  FirstList.swift
//  WarmUp
//
//  Created by 최낙주 on 3/27/24.
//

import SwiftUI

struct FirstList: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    Text("detail 1")
                } label: {
                    Text("1")
                }
                NavigationLink {
                    Text("detail 2")
                } label: {
                    Text("2")
                }
                NavigationLink {
                    Text("detail 3")
                } label: {
                    Text("3")
                }
                NavigationLink {
                    Text("detail 4")
                } label: {
                    Text("4")
                }
            }
            .navigationTitle("Navigtaion")
        }
    }
}

#Preview {
    FirstList()
}
