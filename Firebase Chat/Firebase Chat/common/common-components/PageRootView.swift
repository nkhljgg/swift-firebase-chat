//
//  PageRootView.swift
//  Firebase Chat
//
//  Created by Nikhil on 01/01/23.
//

import Foundation
import SwiftUI

struct PageRootView<Content:View>:View {
    @Environment(\.presentationMode) var presentationMode
    var title:String
    var shouldShowBack = false
    var shouldShowMenuButton = false
    var backAction: (() -> Void)? = nil
    @ViewBuilder var content:Content
    
    var body: some View {
        VStack (spacing: 0) {
            VStack {
                Spacer()
                HStack {
                    HStack {
                        if shouldShowBack {
                            Button {
                                presentationMode.wrappedValue.dismiss()
                                self.backAction?()
                            } label: {
                                Image(systemName:"chevron.backward")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16, height: 16)
                                    .foregroundColor(.white)
                            }
                        }
                        if shouldShowMenuButton {
                            Button {
                                NotificationCenter.default.post(name: Notification.Name("ToggleSideMenu"), object: nil)
                            } label: {
                                Image("sideMenu")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .frame(width: 50, alignment: .leading)
                    Spacer()
                    Text(title)
                        .font(.poppinsTitle3)
                        .foregroundColor(.white)
                    Spacer()
                    HStack {
                        
                    }
                    .frame(width: 50, alignment: .trailing)
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                .frame(maxWidth: .infinity)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
            .frame(height: 120)
            .frame(maxWidth: .infinity)
            .background(GradientView(firstColor: .black, secondColor: .white))
            .cornerRadius(25.0, corners: [.bottomLeft, .bottomRight])
            content
                .frame(maxHeight: .infinity)
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}
