//
//  Appetizer.swift
//  Appetizers
//
//  Created by Macbook on 12/12/24.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let protein: Int
    let calories: Int
    let carbs: Int
}


struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: Int.random(in: 0...5), name: "Test Appetizer", description: "This is description for all appetizer. Let's eat it.", price: 98, imageURL: "", protein: 92, calories: 99, carbs: 92)
    
    static let appetizer = [sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
