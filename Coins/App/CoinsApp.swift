//
//  CoinsApp.swift
//  Coins
//
//  Created by Tarık Nasuhoğlu on 2.11.2021.
//

import SwiftUI

@main
struct CoinsApp: App {
    
    @StateObject private var vm = HomeViewViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView() 
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
