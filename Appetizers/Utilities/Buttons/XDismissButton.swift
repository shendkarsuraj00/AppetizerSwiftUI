//
//  XDismissButton.swift
//  Appetizers
//
//  Created by Macbook on 14/12/24.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 42, height: 42)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    XDismissButton()
}
