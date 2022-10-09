//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Zach Uptin on 4/10/2022.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
        }
    }
}
