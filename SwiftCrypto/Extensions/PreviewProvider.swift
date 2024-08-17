//
//  PreviewProvider.swift
//  SwiftCrypto
//
//  Created by Mert Durkaya on 19/03/2024.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() {}

    let homeVM = HomeViewModel()
    let stat1 = StatisticModel(title: "Market Cap", value: "$1.42T", percentageChange: 12.34)
    let stat1Minus = StatisticModel(title: "Market Cap", value: "$1.42T", percentageChange: -12.34)
    let stat2 = StatisticModel(title: "Total Volume", value: "$1.42B")

    let coin = CoinModel(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400", currentPrice: 65486, marketCap: 1_289_955_140_495, marketCapRank: 1, fullyDilutedValuation: 1_377_649_974_437, totalVolume: 23_826_154_326, high24H: 65937, low24H: 63873, priceChange24H: 378.61, priceChangePercentage24H: 0.58152, marketCapChange24H: 6_828_759_629, marketCapChangePercentage24H: 0.5322, circulatingSupply: 19_663_237, totalSupply: 21_000_000, maxSupply: 21_000_000, ath: 73738, athChangePercentage: -10.9585, athDate: "2024-03-14T07:10:36.635Z", atl: 67.81, atlChangePercentage: 96726.91459, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2021-05-09T04:06:09.766Z", sparklineIn7D: SparklineIn7D(price: [57812.96915967891, 57504.33531773738, 62504.33531773738, 65504.33531773738, 61504.33531773738]), priceChangePercentage24HInCurrency: 1.3923423473152687, currentHoldings: 1)
}
