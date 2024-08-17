//
//  SwiftCryptoApp.swift
//  SwiftCrypto
//
//  Created by Mert Durkaya on 14/03/2024.
//

import SwiftUI

@main
struct SwiftCryptoApp: App {
    @StateObject private var vm = HomeViewModel()
    @State private var showLaunchView: Bool = true

    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().tintColor = UIColor(Color.theme.accent)
        UINavigationBar.appearance().backgroundColor = UIColor.clear
    }

    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationStack {
                    HomeView()
                        .toolbar(.hidden, for: ToolbarPlacement.navigationBar)
                }
                .environmentObject(vm)

                if showLaunchView {
                    withAnimation(.easeOut(duration: 1.0)) {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.scale)
                    }
                }
            }
        }
    }
}
