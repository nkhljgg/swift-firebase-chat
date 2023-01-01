//
//  CreateUserView.swift
//  Firebase Chat
//
//  Created by Nikhil on 01/01/23.
//

import SwiftUI

struct CreateUser: View {
    
    @StateObject var viewModel: CreateUserViewModel = CreateUserViewModel()
    @Binding var creatingNewUser: Bool
    
    var body: some View {
        ZStack {
            Color.clear.ignoresSafeArea()
            ScrollView {
                CardView(shouldExpand: false) {
                    FormTextView(title: AppString.CreateUser.nameTitle, placeholder: AppString.CreateUser.namePlaceholder, validator: viewModel.name)
                    
                    FormTextView(title: AppString.CreateUser.emailTitle, placeholder: AppString.CreateUser.emailPlaceholder, validator: viewModel.email)
                    
                    FormTextView(title: AppString.CreateUser.phoneNumberTitle, placeholder: AppString.CreateUser.phoneNumberPlaceholder, validator: viewModel.phoneNumber)
                    
                    FormTextView(title: AppString.CreateUser.passwordTitle, placeholder: AppString.CreateUser.passwordPlaceholder, validator: viewModel.password)
                    
                    FormTextView(title: AppString.CreateUser.confirmPasswordTitle, placeholder: AppString.CreateUser.confirmPasswordPlaceholder, validator: viewModel.confirmPassword)
                    
                    Button {
                        creatingNewUser.toggle()
    //                    viewModel.createNewUser(email: newUserEmail, password: newUserPassword)
                    } label: {
                        Text("Create New User")
                    }
                }.padding()
            }
        }
    }
}

