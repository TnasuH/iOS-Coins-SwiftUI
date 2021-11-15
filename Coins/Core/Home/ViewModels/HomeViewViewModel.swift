//
//  HomeViewViewModel.swift
//  Coins
//
//  Created by Tarık Nasuhoğlu on 2.11.2021.
//

import Foundation
import Combine

final class HomeViewViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else { return coins }
        let lowerText = text.lowercased()
        return coins.filter { coin -> Bool in
            return coin.name.lowercased().contains(lowerText) ||
            coin.symbol.lowercased().contains(lowerText) ||
            coin.id.lowercased().contains(lowerText)
        }
    }
    
}
