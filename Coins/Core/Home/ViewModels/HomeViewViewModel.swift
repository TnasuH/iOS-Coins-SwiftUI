//
//  HomeViewViewModel.swift
//  Coins
//
//  Created by Tarık Nasuhoğlu on 2.11.2021.
//

import Foundation

final class HomeViewViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now()+2.0) {
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        }
    }
}
