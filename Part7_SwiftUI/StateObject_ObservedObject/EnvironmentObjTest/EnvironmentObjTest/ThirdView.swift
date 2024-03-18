//
//  ThirdView.swift
//  EnvironmentObjTest
//
//  Created by 최낙주 on 3/18/24.
//

import SwiftUI

struct ThirdView: View {
    
    @EnvironmentObject var userProfile: UserProfileSettings
    
    var body: some View {
        
        VStack(spacing: 30) {
            Text("Current Age: \(userProfile.age)")
            
            Text("Third View")
            
            Button {
                userProfile.haveBirthdayParty()
            } label: {
                Text("Having Birthday Party")
            }
        }
        .navigationTitle("Third View")
    }
}

#Preview {
    ThirdView().environmentObject(UserProfileSettings())
}
