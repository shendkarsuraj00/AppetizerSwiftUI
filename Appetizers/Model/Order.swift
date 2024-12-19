//
//  Oder.swift
//  Appetizers
//
//  Created by Macbook on 16/12/24.
//

import Foundation

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func addItem(_ order: Appetizer) {
        items.append(order)
    }
    
    func removeItem(_ indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
}
