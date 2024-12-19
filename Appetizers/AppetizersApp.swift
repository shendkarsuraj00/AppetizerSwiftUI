//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Macbook on 12/12/24.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(Order())
        }
    }
}
