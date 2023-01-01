//
//  AuthView.swift
//  Firebase Chat
//
//  Created by Nikhil on 31/12/22.
//

import Foundation
import SwiftUI

struct AuthView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var creatingNewUser: Bool = false
    
    var viewModel = UsersListViewModel()
    
    var yOffset: CGFloat {
        creatingNewUser ? 0 : UIScreen.main.bounds.height
    }
    var xOffset: CGFloat {
        creatingNewUser ? 0 : -UIScreen.main.bounds.width/2
    }
    
    var body: some View {
        ZStack {
            VStack {
                NavigationStack {
                    CardView(shouldExpand: false) {
                        TextField("Email", text: $email)
                            .textInputAutocapitalization(.never)
                        TextField("Password", text: $password)
                            .textInputAutocapitalization(.never)
                        Button {
                            viewModel.signInUser(email: email, password: password)
                        } label: {
                            Text("Sign In")
                        }
                        
                    }.padding()
                }
            }
            
            if creatingNewUser {
                Color.black.opacity(0.2).ignoresSafeArea().onTapGesture {
                    creatingNewUser.toggle()
                }
            }
            else {
                Color.clear
            }
            
            CreateUser(creatingNewUser: $creatingNewUser)
                .animation(.spring(response: 0.75,
                                   dampingFraction: 0.7,
                                   blendDuration: 1), value: creatingNewUser)
                .offset(x: xOffset, y: yOffset)
            
        }
        .toolbar {
            ToolbarItem {
                Button {
                    creatingNewUser.toggle()
                } label: {
                    Text("New")
                }
                
            }
        }
    }
}

struct CreateUser: View {
    
    @State var newUserEmail: String = ""
    @State var newUserPassword: String = ""
    
    @Binding var creatingNewUser: Bool
    
    var viewModel = UsersListViewModel()
    
    var body: some View {
        ZStack {
            Color.clear.ignoresSafeArea()
            CardView(shouldExpand: false) {
                TextField("Email", text: $newUserEmail)
                    .textInputAutocapitalization(.never)
                    .padding(.vertical)
                TextField("Password", text: $newUserPassword)
                    .textInputAutocapitalization(.never)
                    .padding(.vertical)
                
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

