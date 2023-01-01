//
//  CreateUserViewModel.swift
//  Firebase Chat
//
//  Created by Nikhil on 01/01/23.
//

import Foundation
import Combine
import SwiftUI
import FirebaseAuth
import FirebaseCore

final class CreateUserViewModel:ObservableObject {
    
    @Published var isLoading = false
    
    @Published var name = FormTextModel(name: AppString.CreateUser.namePlaceholder, rules: [.required])
    @Published var email = FormTextModel(name: AppString.CreateUser.emailPlaceholder, rules:[.email])
    @Published var phoneNumber = FormTextModel(name: AppString.CreateUser.phoneNumberPlaceholder, rules:[.noRule])
    @Published var password = FormTextModel(name: AppString.CreateUser.passwordPlaceholder, rules:[.minLength(8)])
    @Published var confirmPassword = FormTextModel(name: AppString.CreateUser.passwordPlaceholder, rules:[.minLength(8)])
    
    @Published var sizes = FormTextModel(rules:[.required])
    @Published var choosenUnit = "Choose your unit"
    
    func createNewUser(email: String, password: String) {
        
        isLoading = true
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            
            print("Email \(email)")
            self?.isLoading = false
        }
    }
    
    func validateForm() {
        name.isValid = name.observedValidity
        email.isValid = email.observedValidity
        password.isValid = password.observedValidity
     }
}
