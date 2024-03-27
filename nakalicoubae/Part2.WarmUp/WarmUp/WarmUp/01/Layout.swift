//
//  Layout.swift
//  WarmUp
//
//  Created by 최낙주 on 3/27/24.
//

import SwiftUI

struct Layout: View {
    var body: some View {
        VStack {
            Image(systemName: "pencil")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .padding()
            
            MyText(text: "Text Element 1", fontSize: .headline)
            MyText(text: "Text Element 2", fontSize: .subheadline)
            MyText(text: "Text Element 3", fontSize: .body)
            
            HStack {
                MyButton(buttonTitle: "Button 1", buttonColor: .blue)
                
                MyButton(buttonTitle: "Button 2", buttonColor: .green)
            }
            Button {
                
            } label: {
                VStack {
                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                    Text("Complex Button")
                        .font(.headline)
                }
                .padding()
                .background(.orange)
                .foregroundStyle(.white)
                .clipShape(.rect(cornerRadius: 10))
            }
        }
    }
}

#Preview {
    Layout()
}
