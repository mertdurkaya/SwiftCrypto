//
//  HomeViewModel.swift
//  SwiftCrypto
//
//  Created by Mert Durkaya on 19/03/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.allCoins.append(PreviewProvider.dev.coin)
            self.portfolioCoins.append(PreviewProvider.dev.coin)
            self.portfolioCoins.append(PreviewProvider.dev.coin)
        }
    }
    
}
