//
//  OrderView.swift
//  Appetizers
//
//  Created by Macbook on 12/12/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order 
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerCell(appetizer: appetizer)
                        }
                        .onDelete { indexSet in
                            order.removeItem(indexSet)
                        }
                        
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        
                    } label: {
                        APButton(name: "$\(order.totalPrice, specifier: "%.2f") - Place order")
                    }
                    .padding(.bottom, 30)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no item in yor cart. \n Please add items to cart to order.")
                }
            }
            .navigationTitle("OrderView")
        }
        
    }
}

#Preview {
    OrderView().environmentObject(Order())
}
