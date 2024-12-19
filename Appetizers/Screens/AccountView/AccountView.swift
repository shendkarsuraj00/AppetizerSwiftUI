//
//  AccountView.swift
//  Appetizers
//
//  Created by Macbook on 12/12/24.
//

import SwiftUI

struct AccountView: View {
 
    @StateObject var viewModel = AccountViewModel()
    @FocusState var focusedTextField: FromTextField?
    
    enum FromTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Personal Info") {
                    TextField("First Name", text: $viewModel.user.firstname)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                    
                    DatePicker("Birthday", selection: $viewModel.user.birthday, in: Date().hunderedYearsAgo...Date().eighteenYearsAgo, displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save changes")
                    }
                }
                
                Section("Request") {
                    Toggle("Extra Napkin", isOn: $viewModel.user.extranapkin)
                    Toggle("Frequent Refill", isOn: $viewModel.user.frequantRefill)
                }
                .tint(Color.brandPrimary)

            }
            .navigationTitle("AccountView")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss"){}
                }
            }
        }
        .onAppear(perform: {
            viewModel.retriveData()
        })
        .alert(viewModel.alertItem?.title ?? Text(""), isPresented: $viewModel.isShowingAlert, presenting: viewModel.alertItem) { alertIteam in
            viewModel.dissmissButton
        } message: { alertIteam in
            alertIteam.message
        }
    }
}

#Preview {
    AccountView()
}
