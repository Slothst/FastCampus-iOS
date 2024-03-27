//
//  ListLoop.swift
//  WarmUp
//
//  Created by 최낙주 on 3/27/24.
//

import SwiftUI

struct ListLoop: View {
    let fruits = ["Apple", "Banana", "Cherry", "Date", "Elderberry"]
//    let price = ["1000", "2000", "3000", "4000", "5000"]
    var body: some View {
        NavigationStack {
            List {
                ForEach(fruits, id: \.self) {
                    Text($0)
                }
            }
            .navigationTitle("Fruit List")
        }
    }
}

#Preview {
    ListLoop()
}
