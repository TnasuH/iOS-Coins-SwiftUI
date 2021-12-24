//
//  XMarkButton.swift
//  Coins
//
//  Created by Tarık Nasuhoğlu on 23.12.2021.
//

import SwiftUI

struct XMarkButton: View {
    
    @Environment(\.dismiss) var dismissFunc

    var body: some View {
        Button(action: {
            dismissFunc()
        },
               label: {
            Image(systemName: "xmark").font(.headline)
        }
        )
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
    }
}
