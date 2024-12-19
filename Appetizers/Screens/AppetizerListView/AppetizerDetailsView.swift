//
//  AppetizerDetailsView.swift
//  Appetizers
//
//  Created by Macbook on 13/12/24.
//

import SwiftUI

struct AppetizerDetailsView: View {
    
    @EnvironmentObject var order: Order
    @Binding var isShowingDetailView: Bool
    let appetizer: Appetizer
    
    var body: some View {
        VStack {
//            AppetizerRemoteImage(urlString: appetizer.imageURL)
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 300, height: 225)
            
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 225)
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 225)
            }

            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionView(title: "Calories", value: appetizer.calories)
                    NutritionView(title: "Carbs", value: appetizer.carbs)
                    NutritionView(title: "Protein", value: appetizer.protein)
                }
            }
            
            Spacer()
            
            Button {
                order.addItem(appetizer)
                isShowingDetailView = false
            } label: {
                APButton(name: "$\(appetizer.price, specifier: "%.2f") - Add to order")
            }
            .padding(.bottom, 30)
            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(.rect(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing, content: {
            Button {
                isShowingDetailView = false
            } label: {
                XDismissButton()
            }
        })
    }
}

#Preview {
    AppetizerDetailsView(isShowingDetailView: .constant(true), appetizer: MockData.sampleAppetizer)
}

struct NutritionView: View {
    
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
