//
//  LoadingView.swift
//  Appetizers
//
//  Created by Macbook on 13/12/24.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndictor = UIActivityIndicatorView(style: .large)
        activityIndictor.color = .brandPrimary
        activityIndictor.startAnimating()
        return activityIndictor
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
    
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ActivityIndicator()
        }
    }
}
