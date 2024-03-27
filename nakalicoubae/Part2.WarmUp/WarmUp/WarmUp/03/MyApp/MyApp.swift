//
//  MyApp.swift
//  WarmUp
//
//  Created by 최낙주 on 3/27/24.
//

import SwiftUI

struct MyApp: View {
    
    @State var showModal: Bool = false
    
    var body: some View {
        TabView {
            FirstList()
                .tabItem {
                    Label("1", systemImage: "square.and.arrow.up")
                }
            Text("2")
                .tabItem {
                    Label("2", systemImage: "square.and.arrow.up")
                }
            Text("3")
                .tabItem {
                    Label("3", systemImage: "square.and.arrow.up")
                }
            Text("4")
                .tabItem {
                    Label("4", systemImage: "square.and.arrow.up")
                }
        }
        .sheet(isPresented: $showModal, content: {
            TabView {
                OnboardingView(onboardingTitle: "온보딩 1", backgroundColor: .blue)
                OnboardingView(onboardingTitle: "온보딩 2", backgroundColor: .gray)
                
                ZStack {
                    Color.gray.ignoresSafeArea()
                    VStack {
                        Text("온보딩3")
                        Button {
                            showModal = false
                        } label: {
                            Text("Start")
                        }
                    }
                }
            }
            .tabViewStyle(.page)
        })
        .onAppear {
            showModal = true
        }
    }
}

#Preview {
    MyApp()
}
