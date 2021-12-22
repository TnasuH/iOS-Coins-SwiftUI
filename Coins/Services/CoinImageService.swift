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
    private let fileManeger = LocalFileManager.instance
    private let folderName = "coin_images"
    private var imageSubscription: AnyCancellable?
    private var imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = fileManeger.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
        } else {
            downloadCoinImage()
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManeger.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
    
}
