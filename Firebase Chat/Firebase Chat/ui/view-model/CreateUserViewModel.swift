//
//  CreateUserViewModel.swift
//  Firebase Chat
//
//  Created by Nikhil on 01/01/23.
//

import Foundation

final class CreateUserViewModel:ObservableObject {
    
    @Published var name = FormTextModel(name: AppString.CreateUser.namePlaceholder, rules: [.required])
    @Published var email = FormTextModel(name: AppString.CreateUser.emailPlaceholder, rules:[.email])
    @Published var phoneNumber = FormTextModel(name: AppString.CreateUser.phoneNumberPlaceholder, rules:[.noRule])
    @Published var password = FormTextModel(name: AppString.CreateUser.passwordPlaceholder, rules:[.minLength(8)])
    @Published var confirmPassword = FormTextModel(name: AppString.CreateUser.passwordPlaceholder, rules:[.minLength(8)])
    
    @Published var sizes = FormTextModel(rules:[.required])
    @Published var choosenUnit = "Choose your unit"
    
    func validateForm() {
        name.isValid = name.observedValidity
        email.isValid = email.observedValidity
        password.isValid = password.observedValidity
     }
}
