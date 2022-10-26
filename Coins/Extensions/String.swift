//
//  String.swift
//  Coins
//
//  Created by Tarık Nasuhoğlu on 2.11.2021.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
