//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Macbook on 12/12/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack {
                List(viewModel.appetizers) { appetizer in
                    AppetizerCell(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShwoingDetailView = true
                        }
                    
                }
                .navigationTitle("AppetizerListView")
                .listStyle(.plain)
                .disabled(viewModel.isShwoingDetailView)
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShwoingDetailView ? 20 : 0)
            
            if viewModel.isShwoingDetailView {
                AppetizerDetailsView(isShowingDetailView: $viewModel.isShwoingDetailView, appetizer: viewModel.selectedAppetizer ?? MockData.sampleAppetizer)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(viewModel.alertItem?.title ?? Text(""), isPresented: $viewModel.isShowingAlert, presenting: viewModel.alertItem) { alertItem in
            Button("Ok") {}
        } message: { alertItem in
            alertItem.message
        }
    }
}

#Preview {
    AppetizerListView()
}
