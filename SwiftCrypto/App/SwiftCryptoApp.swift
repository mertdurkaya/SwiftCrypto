//
//  SwiftCryptoApp.swift
//  SwiftCrypto
//
//  Created by Mert Durkaya on 14/03/2024.
//

import SwiftUI

@main
struct SwiftCryptoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .toolbar(.hidden, for: ToolbarPlacement.navigationBar)
            }
        }
    }
}
