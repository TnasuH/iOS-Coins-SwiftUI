//
//  UIApplication.swift
//  Coins
//
//  Created by Tarık Nasuhoğlu on 15.11.2021.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
