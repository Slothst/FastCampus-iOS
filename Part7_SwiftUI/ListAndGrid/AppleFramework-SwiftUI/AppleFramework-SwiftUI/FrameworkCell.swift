//
//  FrameworkCell.swift
//  AppleFramework-SwiftUI
//
//  Created by 최낙주 on 3/18/24.
//

import SwiftUI

struct FrameworkCell: View {
    
    var framework: AppleFramework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            Text(framework.name)
                .font(.system(size: 16, weight: .bold))
            Spacer()
        }
    }
}

#Preview {
    FrameworkCell(framework: AppleFramework.list[0])
        .previewLayout(.fixed(width: 160, height: 250))
}
