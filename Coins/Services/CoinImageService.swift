//
//  CoinImageService.swift
//  Coins
//
//  Created by Tarık Nasuhoğlu on 11.11.2021.
//

import Foundation
import UIKit
import Combine

class CoinImageService {
    
    @Published var image: UIImage?
    private var coin: CoinModel
    
    var imageSubscription: AnyCancellable?
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinImage()
    }
    
    private func getCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
                self?.imageSubscription?.cancel()
            })
    }
    
}
