//
//  APButton.swift
//  Appetizers
//
//  Created by Macbook on 14/12/24.
//

import SwiftUI

struct APButton: View {
    let name: LocalizedStringKey
    
    var body: some View {
        Text(name)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundStyle(.white)
            .background(Color(.brandPrimary))
            .clipShape(.buttonBorder)
    }
}

#Preview {
    APButton(name: "Test name")
}
