//
//  ContentView.swift
//  SwiftUI-Basic
//
//  Created by 최낙주 on 3/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ImageView()
            ButtonView()
            TextView()
            
            Spacer()
            
            HStack {
                ImageView()
                ButtonView()
                TextView()
            }
            
            Spacer()
            
            ZStack {
                ImageView()
                ButtonView()
                TextView()

            }
        }
    }
}

#Preview {
    ContentView()
}
