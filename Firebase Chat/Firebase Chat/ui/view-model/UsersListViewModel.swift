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
    @Published var password = FormTextModel(name: AppString.CreateUser.passwordPlaceholder, rules:[.minLength(8)])
    
    var currentUser: User?
    
    var usersList: [User] = [.init(id: "1", name: "Nikhil", email: "test1@gmail.com"),
                             .init(id: "2", name: "Anchal", email: "test2@gmail.com"),
                             .init(id: "3", name: "Shaurya", email: "test3@gmail.com")]
    
    func validateForm() {
        email.isValid = email.observedValidity
        password.isValid = password.observedValidity
     }
    
    func createNewUser(email: String, password: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            print("Email \(email)")
            
        }
        
    }
    
    func signInUser(email: String, password: String){
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, err in
           
            guard let strongSelf = self else { return }
            
            if let email = result?.user.email, let id = result?.user.uid {
                strongSelf.currentUser = User(id: id, name: "Nikhil", email: email)
                
                print(email)
                
            }
        }
    }
}
