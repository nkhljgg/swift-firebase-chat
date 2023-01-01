//
//  FormButton.swift
//  SwiftUI Utilities
//
//  Created by Nikhil on 01/01/23.
//

import Foundation
import SwiftUI

struct FormButton:View {
    var title:String
    var placeHolder:String
    var action:() -> Void
    
    @ObservedObject var validator:FormTextModel
    
    init(title:String, placeholder:String,
         validator:FormTextModel,
         action:@escaping () -> Void) {
        self.title = title
        self.placeHolder = placeholder
        self.validator = validator
        self.action = action
    }
    
    var body: some View {
        VStack {
            Text(title)
                .fontWeight(.bold)
                .frame(maxWidth:.infinity, alignment:.leading)
                .foregroundColor(validator.color)
            FormFieldWrapper(content: {
                if validator.text == "" {
                    Text(placeHolder).foregroundColor(.gray)
                        .frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
                } else {
                    Text(validator.text).lineLimit(nil)
                        .frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
                }
            }, validator: validator)
            .background(Color.white.opacity(0.01))
            .onTapGesture {
                action()
            }
            .background(Color(hex: 0xEDECEC))
        }
    }
}
