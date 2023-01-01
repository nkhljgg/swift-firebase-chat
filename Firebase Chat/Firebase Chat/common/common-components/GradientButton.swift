//
//  GradientButton.swift
//  Firebase Chat
//
//  Created by Nikhil on 01/01/23.
//

import Foundation
import SwiftUI

struct GradientButton: View {
    
    var title:String
    var width:Double = 300.0
    var fontSize:CGFloat = 15
    var height:Double = 44.0
    var action:() -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Text(NSLocalizedString(title, comment: ""))
                    .font(.poppinsTitle3)
                    .foregroundColor(Color.white)
                    .lineLimit(nil)
                    .font(.system(size: fontSize))
            }
            .padding()
            .frame(minWidth:width)
            .frame(height:height)
        }
        .background(
            GradientView(firstColor: .black, secondColor: .white)
        ).cornerRadius(32)
            .padding()
    }
}
