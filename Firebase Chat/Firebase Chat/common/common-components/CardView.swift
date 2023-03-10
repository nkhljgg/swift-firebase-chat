//
//  CardView.swift
//  Firebase Chat
//
//  Created by Nikhil on 01/01/23.
//

import Foundation
import SwiftUI

struct CardView<Content:View>:View {
    var radius:Int = 12
    var shadowColor = Color.black.opacity(0.3)
    var shadowRadius = 4
    var backgroundColor = Color.white

    var shouldExpand = true
    var padding = 16.0
    
    @ViewBuilder var content:Content
    
    var body: some View {
        ZStack {
            if shouldExpand {
                VStack {
                    content
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(minHeight: 0, maxHeight:  .infinity)
                .padding(padding)
                .background(backgroundColor)
                .cornerRadius(CGFloat(radius))
                .shadow(color: shadowColor, radius: CGFloat(shadowRadius), x: 0, y: 0)
            } else {
                VStack {
                    content
                }
                .padding()
                .background(backgroundColor)
                .cornerRadius(CGFloat(radius))
                .shadow(color: shadowColor, radius: CGFloat(shadowRadius), x: 0, y: 0)
            }
        }
    }
}

