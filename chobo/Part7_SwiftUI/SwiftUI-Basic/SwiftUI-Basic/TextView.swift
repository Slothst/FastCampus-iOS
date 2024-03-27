//
//  TextView.swift
//  SwiftUI-Basic
//
//  Created by 최낙주 on 3/16/24.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        Text("SwiftUI")
            .font(.system(size: 40, weight: .bold, design: .default))
    }
}

#Preview {
    TextView()
}
