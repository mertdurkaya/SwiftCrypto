//
//  PortfolioView.swift
//  SwiftCrypto
//
//  Created by Mert Durkaya on 07/04/2024.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var selectedCoin: CoinModel? = nil
    @State private var quantityText: String = ""
    @State private var showCheckmark: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $vm.searchText)
                        .padding()
                    coinLogoList
                    
                    if selectedCoin != nil {
                        portfolioInputSection
                    }
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    XMarkButton()
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    trailingNavBarButton
                }
            }
            .onChange(of: vm.searchText) { _, newValue in
                if newValue == "" {
                    withAnimation(.easeIn) {
                        removeSelectedCoin()
                    }
                }
            }
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
            .environmentObject(dev.homeVM)
    }
}

extension PortfolioView {
    private var coinLogoList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(vm.searchText.isEmpty && !vm.portfolioCoins.isEmpty ? vm.portfolioCoins : vm.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                updateSelectedCoin(coin: coin)
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedCoin?.id == coin.id ? Color.theme.green : Color.clear,
                                        lineWidth: 1)
                        )
                    
                }
            }
            .frame(height: 120)
            .padding(.vertical, 4)
            .padding(.leading)
        }
    }
    
    private func updateSelectedCoin(coin: CoinModel) {
        selectedCoin = coin
        
        if let portfolioCoin = vm.portfolioCoins.first(where: { $0.id == coin.id }) {
            let amount = portfolioCoin.currentHoldings
            quantityText = "\(amount ?? 0)"
        } else {
            quantityText = ""
        }
    }
    
    private var portfolioInputSection: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Current price of \(selectedCoin?.symbol.uppercased() ?? ""):")
                Spacer()
                Text(selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")
            }
            Divider()
            HStack {
                Text("Amount holding:")
                Spacer()
                TextField("Ex: 1.2", text: $quantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            Divider()
            HStack {
                Text("Current value:")
                Spacer()
                Text(getCurrentValue().asCurrencyWith2Decimals())
            }
        }
        .animation(.none, value: 0)
        .padding()
    }
    
    private func getCurrentValue() -> Double {
        if let quantity = Double(quantityText) {
            return (selectedCoin?.currentPrice ?? 0) * quantity
        }
        return 0
    }
    
    private var trailingNavBarButton: some View {
        Button(action: {
            saveButtonPressed()
        }, label: {
            ZStack {
                Image(systemName: "checkmark")
                    .opacity(showCheckmark ? 1.0 : 0.0)
                    .animation(.easeIn, value: showCheckmark)
                Text("Save")
                    .opacity(selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText) ? 1.0 : 0.0)
            }
            .font(.headline)
        })
    }
    
    
    
    private func saveButtonPressed() {
        guard let coin = selectedCoin,
              let amount = Double(quantityText) else { return }
        
        // save portfolio
        vm.updatePortfolio(coin: coin, amount: amount)
        
        // show checkmark
        withAnimation {
            showCheckmark = true
            removeSelectedCoin()
        }
        
        // hide keyboard
        UIApplication.shared.endEditing()
        
        //hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                showCheckmark = false
            }
        }
    }
    
    private func removeSelectedCoin() {
        selectedCoin = nil
        vm.searchText = ""
        quantityText = ""
    }
}
