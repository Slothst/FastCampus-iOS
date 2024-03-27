//
//  MyButton.swift
//  WarmUp
//
//  Created by 최낙주 on 3/27/24.
//

import SwiftUI

struct MyButton: View {
    
    var buttonTitle: String
    var buttonColor: Color
    
    var body: some View {
        Button {
            
        } label: {
            Text(buttonTitle)
                .font(.headline)
                .padding()
                .background(buttonColor)
                .foregroundStyle(.white)
                .clipShape(.buttonBorder)
        }
    }
}

#Preview {
    MyButton(buttonTitle: "Button2", buttonColor: .green)
}
