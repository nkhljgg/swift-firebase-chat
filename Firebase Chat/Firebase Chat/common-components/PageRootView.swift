//
//  PageRootView.swift
//  Firebase Chat
//
//  Created by Nikhil on 01/01/23.
//

import Foundation
import SwiftUI

struct PageRootView<Content:View>:View {
    
    var title:String
    @ViewBuilder var content:Content
    
    var body: some View {
        VStack(spacing:0) {
            VStack {
                Spacer()
                HStack {
                    Text(NSLocalizedString(title, comment: ""))
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                }
                Spacer()
                    .frame(height:16.0)
            }
            .frame(height:120)
            .frame(maxWidth:.infinity)
            .background(
                GradientView(firstColor: .black, secondColor: .white)
            )
            .cornerRadius(25.0, corners: [.bottomLeft, .bottomRight])
            NavigationView {
                content
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}
