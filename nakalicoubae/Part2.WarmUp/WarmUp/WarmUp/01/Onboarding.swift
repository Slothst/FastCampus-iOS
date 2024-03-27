//
//  Onboarding.swift
//  WarmUp
//
//  Created by 최낙주 on 3/27/24.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        VStack {
            Spacer()
            Text("What's New in Photos")
                .font(.system(size: 35, weight: .bold))
                .padding()
            
            HStack {
                Image(systemName: "person.2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .padding(.horizontal, 4)
                    .foregroundStyle(.blue)
                
                VStack(alignment: .leading) {
                    Text("Shared Library")
                        .font(.headline)
                    Text("Combine photos and videos with the people closest to you and automatically share new photos from Camera.")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                .padding(.trailing)
            }
            .padding()
            
            HStack {
                Image(systemName: "slider.horizontal.2.square.on.square")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .padding(.horizontal, 4)
                    .foregroundStyle(.blue)
                
                VStack(alignment: .leading) {
                    Text("Copy & Paste Edits")
                        .font(.headline)
                    Text("Save time by making edits to one\nphoto, than applying the changes to\nother photos with a tap.")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                    
                }
                .padding(.trailing, 50)
            }
            .padding()
            
            HStack {
                Image(systemName: "square.on.square")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .padding(.horizontal, 4)
                    .foregroundStyle(.blue)
                
                VStack(alignment: .leading) {
                    Text("Merge Duplicates")
                        .font(.headline)
                    Text("Quickly find and merge all your\nduplicate photos and videos from one central place in the Albums tab.")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                .padding(.trailing, 38)
            }
            .padding()
            
            Spacer()
            Spacer()
            Spacer()
            
            Button {
                
            } label: {
                Text("Continue")
                    .padding()
                    .frame(width: 350)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 15))
            }
            Spacer()
        }
    }
}

#Preview {
    Onboarding()
}
