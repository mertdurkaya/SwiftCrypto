//
//  PreviewProvider.swift
//  SwiftCrypto
//
//  Created by Mert Durkaya on 19/03/2024.
//

import Foundation
import SwiftUI

struct PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let homeVM = HomeViewModel()
    
    let coin = CoinModel(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "", currentPrice: 58908, marketCap: 1100013258170, marketCapRank: 1, fullyDilutedValuation: 1235028318246, totalVolume: 69075964521, high24H: 59504, low24H: 57672, priceChange24H: 808.94, priceChangePercentage24H: 1.39234, marketCapChange24H: 13240944103, marketCapChangePercentage24H: 1.21837, circulatingSupply: 18704250, totalSupply: 21000000, maxSupply: 21000000, ath: 64805, athChangePercentage: -9.24909, athDate: "2021-04-14T11:54:46.763Z", atl: 67.81, atlChangePercentage: 86630.1867, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2021-05-09T04:06:09.766Z", sparklineIn7D: SparklineIn7D(price: [57812.96915967891, 57504.33531773738]), priceChangePercentage24HInCurrency: 1.3923423473152687, currentHoldings: 1)
}
