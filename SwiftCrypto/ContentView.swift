//
//  ContentView.swift
//  SwiftCrypto
//
//  Created by Mert Durkaya on 14/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                Text("SwiftCrypto")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.accent)
                
                Text("Portfolio balance")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.secondaryText)
                
                HStack {
                    Text("Current balance:")
                        .font(.callout)
                        .foregroundColor(Color.theme.green)
                    
                    Text("$100.00")
                        .font(.callout)
                        .foregroundColor(Color.theme.red)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
