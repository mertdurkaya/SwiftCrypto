//
//  HomeView.swift
//  SwiftCrypto
//
//  Created by Mert Durkaya on 14/03/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolioView: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView, content: {
                    PortfolioView()
                        .environmentObject(vm)
                })
            
            VStack {
                homeHeader
                HomeStatsView(showPortfolio: $showPortfolio)
                SearchBarView(searchText: $vm.searchText)
                colums

                if !showPortfolio {
                    allCoinsList
                    .transition(.move(edge: .leading))
                }
                
                if showPortfolio {
                    portfolioList
                        .transition(.move(edge: .trailing))
                }
                
                Spacer()
            }
        }
        .refreshable {
            vm.reloadData()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .toolbar(.hidden, for: ToolbarPlacement.navigationBar)
            .environmentObject(dev.homeVM)
    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .onTapGesture {
                    if showPortfolio {
                        showPortfolioView.toggle()
                    }
                }
                .background(CircleButtonAnimationView(animate: $showPortfolio))
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(
                        .init(
                            top: 10,
                            leading: 0,
                            bottom: 10,
                            trailing: 10
                        )
                    )
            }
        }
        .listStyle(.plain)
    } 
    
    private var portfolioList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(
                        .init(
                            top: 10,
                            leading: 0,
                            bottom: 10,
                            trailing: 10
                        )
                    )
            }
        }
        .listStyle(.plain)
    }
    
    private var colums: some View {
        HStack {
            Text("Coins")
            Spacer()
            if showPortfolio {
                Text("Holdings")
            }
            Text("Price")
                .frame(
                    width: UIScreen.main.bounds.width / 3.5,
                    alignment: .trailing
                )
            
            Button {
                withAnimation(.bouncy) {
                    vm.reloadData()
                }
            } label: {
                Image(systemName: "goforward")
            }
            .rotationEffect(
                Angle(degrees: vm.isLoading ? 360 : 0),
                anchor: .center
            )

        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}
