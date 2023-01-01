//
//  AuthView.swift
//  Firebase Chat
//
//  Created by Nikhil on 31/12/22.
//

import Foundation
import SwiftUI

struct AuthView: View {
    
    @State var creatingNewUser: Bool = false
    var viewModel = UsersListViewModel()
    
    var yOffset: CGFloat {
        creatingNewUser ? 0 : UIScreen.main.bounds.height
    }
    var xOffset: CGFloat {
        creatingNewUser ? 0 : -UIScreen.main.bounds.width/2
    }
    
    var body: some View {
        PageRootView(title: "Welcome") {
            ZStack {
                VStack {
                    
                        CardView(shouldExpand: false) {
                            
                            FormTextView(title: AppString.CreateUser.emailTitle, placeholder: AppString.CreateUser.emailPlaceholder, validator: viewModel.email)
                            FormTextView(title: AppString.CreateUser.passwordTitle, placeholder: AppString.CreateUser.passwordPlaceholder, validator: viewModel.password)
                            
                            GradientButton(title: "Sign In") {
                                viewModel.validateForm()
//                                viewModel.signInUser(email: viewModel.email.text, password: viewModel.password.text)
                            }
                            
                            Button {
                                creatingNewUser.toggle()
                            } label: {
                                Text("Create Account").foregroundColor(.black)
                            }
                            
                        }.padding()
                    
                    Spacer()
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

