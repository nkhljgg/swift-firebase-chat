//
//  CustomFontView.swift
//  Firebase Chat
//
//  Created by Nikhil on 01/01/23.
//

import Foundation
import SwiftUI

public struct CustomFontView: View {
    
    public init() { }
    
    public var body: some View {
        Text("Poppins")
            .font(.poppinsLargeTitle)
        
        Text("Poppins")
            .font(.system(size: 60))
    }
}
