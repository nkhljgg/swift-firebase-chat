//
//  GradientView.swift
//  Firebase Chat
//
//  Created by Nikhil on 01/01/23.
//

import Foundation
import SwiftUI

struct GradientView:View {
    
    var firstColor: UIColor
    var secondColor: UIColor
    
    var body: some View {
        LinearGradient(gradient:
                        Gradient(colors: [Color(firstColor),
                                          Color(secondColor)]),
                       startPoint: .leading,
                       endPoint: .trailing)
    }
}
