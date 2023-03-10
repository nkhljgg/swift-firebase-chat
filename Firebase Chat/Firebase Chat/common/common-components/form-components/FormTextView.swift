//
//  TextContainer.swift
//  SwiftUI Utilities
//
//  Created by Nikhil on 01/01/23.
//

import SwiftUI

struct FormTextView:View {
    
    var manager = AppearanceManager()
    
    var title:String
    var placeHolder:String
    @ObservedObject var validator:FormTextModel
    
    init(title:String, placeholder:String, validator:FormTextModel) {
        self.title = title
        self.placeHolder = placeholder
        self.validator = validator
    }
    
    var body: some View {
        VStack {
            Text(title)
                .font(.poppinsHeadline)
                .frame(maxWidth:.infinity, alignment:.leading)
                .foregroundColor(validator.color)
            FormFieldWrapper(content: {
                Divider()
                    .frame(maxWidth:1.0, maxHeight: 20)
                    .background(validator.color)
                TextField(placeHolder, text: $validator.text)
                    .font(.poppins)
                    .foregroundColor(manager.theme.formControlText ?? .black)
                    .multilineTextAlignment(.leading)
            },validator: validator)
        }
    }
}


