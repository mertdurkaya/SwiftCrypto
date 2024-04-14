//
//  DetailViewModel.swift
//  SwiftCrypto
//
//  Created by Mert Durkaya on 14/04/2024.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailService.$coinDetails
            .sink { (returnedCoinDetails) in
                print(returnedCoinDetails)
            }
            .store(in: &cancellables)
    }
}
