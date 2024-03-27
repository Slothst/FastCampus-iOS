//
//  MyText.swift
//  WarmUp
//
//  Created by 최낙주 on 3/27/24.
//

import SwiftUI

struct MyText: View {
    
    var text: String
    var fontSize: Font
    
    var body: some View {
        Text(text)
            .font(fontSize)
            .padding()
    }
}

#Preview {
    MyText(text: "Text Element 1", fontSize: .headline)
}
