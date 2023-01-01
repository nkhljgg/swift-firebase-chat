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
    @ObservedObject var viewModel = UsersListViewModel()
    
    var yOffset: CGFloat {
        creatingNewUser ? 0 : UIScreen.main.bounds.height
    }
    var xOffset: CGFloat {
        creatingNewUser ? 0 : -UIScreen.main.bounds.width/2
    }
    
    var body: some View {
        NavigationStack {
        ZStack {
            PageRootView(title: "Welcome") {
                VStack {
                    
                    CardView(shouldExpand: false) {
                        
                        FormTextView(title: AppString.CreateUser.emailTitle, placeholder: AppString.CreateUser.emailPlaceholder, validator: viewModel.email)
                        FormTextView(title: AppString.CreateUser.passwordTitle, placeholder: AppString.CreateUser.passwordPlaceholder, validator: viewModel.password)
                        
                    
                        NavigationLink(isActive: $viewModel.signInSuccess) {
                            ListView()
                        } label: {
                            GradientButton(title: "Sign In") {
                                viewModel.signInSuccess = true
//                                viewModel.validateAndSubmit()
                            }
                        }

                        Button {
                            creatingNewUser.toggle()
                        } label: {
                            Text("Create Account")
                                .frame(width: 270)
                                .foregroundColor(Color(uiColor: UIColor.black))
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .padding(.init(top: 10, leading: 15, bottom: 10, trailing: 15))
                                
                        }.background(Capsule().stroke(lineWidth: 1))
                            .foregroundColor(Color(uiColor: UIColor.black))
                        
                    }.padding()
                    
                    Spacer()
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
            
            if viewModel.isLoading {
                Color.black.opacity(0.2).ignoresSafeArea()
                ActivityIndicatorView(isAnimating: viewModel.isLoading)
            }
        }
    }
    
    }
}

