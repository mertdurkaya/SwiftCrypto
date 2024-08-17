//
//  SettingsView.swift
//  SwiftCrypto
//
//  Created by Mert Durkaya on 15/08/2024.
//

import SwiftUI

struct SettingsView: View {
    let defaultURL = URL(string: "https://www.google.com")!
    let youtubeURL = URL(string: "https://www.youtube.com/c/swiftfulthinking")!
    let coffeeURL = URL(string: "https://www.buymeacoffee.com/mertdurkaya")!
    let coinGeckoURL = URL(string: "https://www.coingecko.com")!
    let personalURL = URL(string: "https://www.mertdurkaya.com")!

    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                List {
                    appSection
                    linkSection
                    coinGeckoSection
                }
                .listRowBackground(Color.theme.background.opacity(0.5))
            }
            .font(.headline)
            .accentColor(.blue)
            .navigationTitle("About")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    private var appSection: some View {
        Section(content: {
            HStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()

                VStack(alignment: .leading) {
                    Text("SwiftCrypto")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.theme.accent)
                    Text("SwiftUI Crypto Currency App")
                        .font(.caption)
                        .foregroundColor(.theme.secondaryText)
                    Divider()
                    Text("Version 1.0.0")
                        .font(.caption)
                        .foregroundColor(.theme.secondaryText)
                    Link("Privacy Policy", destination: defaultURL)
                        .font(.caption)
                }
            }
        }, header: {
            Text("Application")
                .font(.caption)
                .bold()
        })
    }

    private var linkSection: some View {
        Section(content: {
            Link("Swiftful Thinking YouTube ", destination: youtubeURL)
            Link("Buy Me A Coffee ☕️", destination: coffeeURL)
            Link("Personal Website", destination: personalURL)
        }, header: {
            Text("Support")
                .font(.caption)
                .bold()
        })
        .font(.subheadline)
    }

    private var coinGeckoSection: some View {
        Section(content: {
            HStack {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                Spacer()
                Text("The cryptocurrency data that is used in this app comes from a free API powered by CoinGecko. Prices may be slightly delayed.")
                    .font(.caption)
                    .foregroundColor(.theme.secondaryText)
            }

            Link("Visit CoinGecko", destination: coinGeckoURL)
        }, header: {
            Text("Data provided by")
                .font(.caption)
                .bold()
        })
        .font(.subheadline)
    }
}
