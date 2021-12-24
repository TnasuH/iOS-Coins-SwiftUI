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
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.theme.accent)]
    }
    
    
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
