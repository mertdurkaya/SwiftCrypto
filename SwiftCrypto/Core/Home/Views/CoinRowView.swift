//
//  CoinRowView.swift
//  SwiftCrypto
//
//  Created by Mert Durkaya on 19/03/2024.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing:0) {
            leftColumn
            Spacer()
            if showHoldingsColumn {
                centerColumn
            }
            rightColumn
        }
        .font(.subheadline)
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    CoinRowView(coin: PreviewProvider.dev.coin, showHoldingsColumn: true)
        .preferredColorScheme(.dark)
}

extension CoinRowView {
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 32)
            CoinImageView(coin: coin)
                .frame(width: 32, height: 32)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(Color.theme.accent)
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
                .foregroundStyle(Color.theme.accent)
            Text((coin.currentHoldings ?? 0).asNumberString())
                .foregroundStyle(Color.theme.secondaryText)
        }
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundStyle(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundStyle((coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
