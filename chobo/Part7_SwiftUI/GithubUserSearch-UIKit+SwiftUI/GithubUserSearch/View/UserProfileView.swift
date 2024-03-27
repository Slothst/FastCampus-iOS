//
//  UserProfileView.swift
//  GithubUserSearch
//
//  Created by 최낙주 on 3/19/24.
//

import SwiftUI
import Kingfisher

struct UserProfileView: View {
    
    @StateObject var viewModel: UserProfileViewModel
    
    var body: some View {
        VStack(spacing: 80) {
            KFImage(viewModel.imageURL)
                .resizable()
                .frame(width: 160, height: 160)
                .background(.gray)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 40) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(viewModel.name)
                        .font(.system(size: 24, weight: .bold))
                    Text(viewModel.login)
                        .font(.system(size: 18, weight: .regular))
                        .foregroundStyle(.gray)
                }
                
                VStack {
                    Text("\(viewModel.followers)")
                    Text("\(viewModel.following)")
                }
                .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
        }
        .onAppear {
            let id = viewModel.loginID
            viewModel.search(keyword: id)
        }
    }
}

#Preview {
    UserProfileView(viewModel: UserProfileViewModel(loginID: "Slothst", network: NetworkService(configuration: .default)))
}
