//
//  FormTextViewWithRightAction.swift
//  SwiftUI Utilities
//
//  Created by Nikhil on 01/01/23.
//

import Foundation
import SwiftUI

struct FormTextViewWithRightAction:View {
    var title:String
    var placeHolder:String
    @ObservedObject var validator:FormTextModel
    var inputType:UIKeyboardType
    var rightActionTitle:Binding<String>
    var rightAction:() -> Void
    
    init(title:String,
         placeholder:String,
         validator:FormTextModel,
         inputType:UIKeyboardType = .default,
         rightActionTitle:Binding<String>,
         rightAction:@escaping () -> Void) {
        
        self.title = title
        self.placeHolder = placeholder
        self.validator = validator
        self.rightActionTitle = rightActionTitle
        self.inputType = inputType
        self.rightAction = rightAction
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .fontWeight(.bold)
                    .frame(maxWidth:.infinity, alignment:.leading)
                    .foregroundColor(validator.color)
                Spacer()
                HStack {
                    Text(rightActionTitle.wrappedValue).font(.system(size: 9))
                    Image(systemName: "pencil")
                        .foregroundColor(.green)
                }.onTapGesture {
                    rightAction()
                }
            }
            FormFieldWrapper(content: {
                Divider()
                    .frame(maxWidth:1.0, maxHeight: 20)
                    .background(validator.color)
                TextField(placeHolder, text: $validator.text)
                    .multilineTextAlignment(.leading)
                    .keyboardType(inputType)
            },validator: validator)
        }
    }
}
