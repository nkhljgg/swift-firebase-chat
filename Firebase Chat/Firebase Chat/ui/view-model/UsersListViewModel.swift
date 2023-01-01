//
//  UsersListViewModel.swift
//  Firebase Chat
//
//  Created by Nikhil on 31/12/22.
//

import Foundation
import Combine
import SwiftUI
import FirebaseAuth
import FirebaseCore

class UsersListViewModel: ObservableObject {
    
    @Published var email = FormTextModel(name: AppString.CreateUser.emailPlaceholder, rules:[.email])
    @Published var password = FormTextModel(name: AppString.CreateUser.passwordPlaceholder, rules:[.notEmpty])
    
    @Published var isLoading = false
    
    @Published var signInSuccess = false
    
    private lazy var allFormFields: [FormTextModel] = {
        return [email, password]
    }()
    
    var currentUser: User?
    
    var usersList: [User] = [.init(id: "1", name: "Nikhil", email: "test1@gmail.com"),
                             .init(id: "2", name: "Anchal", email: "test2@gmail.com"),
                             .init(id: "3", name: "Shaurya", email: "test3@gmail.com")]
    
    
    func validateAndSubmit() {
        
        isLoading = true
        
        var isFormValid = true
        
        for field in allFormFields {
            field.isValid = field.observedValidity
            if !field.isValid {
                // if form is already invalid, it shouldn't set the form status to true
                if isFormValid {
                    isFormValid = false
                    isLoading = false
                }
            }
        }
        
        if isFormValid {
            signInUser(email: email.text, password: password.text)
        }
    }
    
    func signInUser(email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, err in
           
            guard let strongSelf = self else { return }
            
            strongSelf.isLoading = false
            
            if let email = result?.user.email, let id = result?.user.uid {
                strongSelf.currentUser = User(id: id, name: "Nikhil", email: email)
                
                print("Success")
                strongSelf.signInSuccess = true
            }
        }
    }
}
