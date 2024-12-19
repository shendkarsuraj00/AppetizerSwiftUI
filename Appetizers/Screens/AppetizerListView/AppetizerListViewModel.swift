//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Macbook on 13/12/24.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isShowingAlert: Bool = false
    @Published var isLoading = false
    @Published var isShwoingDetailView = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers() {
        isLoading = true
        NetworkManger.shared.getAppetizer { result in
            DispatchQueue.main.async { [weak self] in
                self?.isLoading = false
                switch result {
                case .success(let appetizers):
                    self?.appetizers = appetizers
                case .failure(let error):
                    self?.isShowingAlert = true
                    switch error {
                    case .invalidData:
                        self?.alertItem = AlertContext.invalidData
                    case .invalidResponse:
                        self?.alertItem =  AlertContext.invalidResponse
                    case .invalidURL:
                        self?.alertItem =  AlertContext.invalidURL
                    case .unableToComplete:
                        self?.alertItem =  AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
