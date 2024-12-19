//
//  ContentView.swift
//  Appetizers
//
//  Created by Macbook on 12/12/24.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var oder: Order
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") { AppetizerListView() }
            
            Tab("Account", systemImage: "person") { AccountView() }
            
            Tab("Order", systemImage: "bag") { OrderView() }
            .badge(oder.items.count)
        }
        .tint(.brandPrimary)
    }
}

#Preview {
    AppetizerTabView().environmentObject(Order())
}
