//
//  LaunchView.swift
//  SwiftCrypto
//
//  Created by Mert Durkaya on 16/08/2024.
//

import SwiftUI

struct LaunchView: View {
    
    @State private var loadingText: [String] = "Loading portfolio...".map { String($0) }
    @State private var showLoadingText: Bool = false
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var counter = 0
    @State private var loops: Int = 0
    @Binding var showLaunchView: Bool
    
    var body: some View {
        ZStack {
            Color.launch.background
                .ignoresSafeArea()
            
            Image("logo-transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            ZStack {
                if showLoadingText {
                    HStack(spacing: 0) {
                        ForEach(loadingText.indices) { index in
                            Text(loadingText[index])
                                .font(.system(size: 16, weight: .heavy, design: .monospaced))
                                .foregroundColor(.launch.accent)
                                .offset(y: counter == index ? -16 : 0)
                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeIn))
                }
            }
            .offset(y: 70)
        }
        .onAppear {
            showLoadingText.toggle()
        }
        .onReceive(timer, perform: { _ in
            withAnimation(.easeInOut) {
                if counter == loadingText.count - 1 {
                    counter = 0
                    loops += 1
                    if loops >= 2 {
                        showLoadingText = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation {
                                showLaunchView = false
                            }
                        }
                    }
                } else {
                    counter += 1
                }
            }
        })
    }
}

#Preview {
    LaunchView(showLaunchView: .constant(true))
        
}
