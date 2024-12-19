//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Macbook on 16/12/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userdata: Data?
    @Published var user = User()
    @Published var isShowingAlert = false
    @Published var alertItem: AlertItem?
    @Published var dissmissButton: Button = Button("Ok") {}
    
    var isValidForm: Bool {
        
        guard !user.firstname.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            isShowingAlert = true
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            isShowingAlert = true
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
        
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        isShowingAlert = true
        do {
            let data = try JSONEncoder().encode(user)
            userdata = data
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retriveData() {
        
        guard let userdata else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userdata)
            
        } catch {
            isShowingAlert = true
            alertItem = AlertContext.invalidUserData
        }
    }
    
}
