//
//  HomeView.swift
//  Coins
//
//  Created by Tarık Nasuhoğlu on 2.11.2021.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewViewModel
    
    @State private var isPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            //background layer
            
            Color.theme.background
                .ignoresSafeArea()
            
            //contents
            VStack {
                headerView
                
                SearchBarView(searchText: $vm.searchText)
                
                columnsTitleOfList
                
                if isPortfolio {
                    portfolioCoinList
                        .transition(.move(edge: .trailing))
                }
                ///Don't use if else in here because of there is .transition animation function's side effects in here
                if !isPortfolio {
                    allCoinList
                        .transition(.move(edge: .leading))
                }
                
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
            .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}

extension HomeView {
    
    private var headerView: some View {
        HStack {
            CircleButtonView(iconName: isPortfolio ? "plus":"info")
                .animation(.none, value: isPortfolio)
                .background(
                    CircleButtonAnimationView(animate: $isPortfolio)
                )
            Spacer()
            Text(isPortfolio ? "Portfolio": "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.theme.accent)
                .animation(.none, value: isPortfolio)
                
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: isPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        isPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    //.listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var portfolioCoinList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    //.listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var columnsTitleOfList: some View {
        HStack {
            Text("Coin")
            Spacer()
            if isPortfolio {
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(.theme.secondaryText)
        .padding(.horizontal)
    }
    
}
