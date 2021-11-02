//
//  HomeView.swift
//  Coins
//
//  Created by Tarık Nasuhoğlu on 2.11.2021.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            //background layer
            Color.theme.background
                .ignoresSafeArea()
            
            //contents
            VStack {
                headerView
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
    
}
