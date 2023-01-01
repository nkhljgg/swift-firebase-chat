//
//  FormTextEditor.swift
//  SwiftUI Utilities
//
//  Created by Nikhil on 01/01/23.
//

import SwiftUI

struct FormTextEditor:View {
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
                .fontWeight(.bold)
                .frame(maxWidth:.infinity, alignment:.leading)
                .foregroundColor(validator.color)
            FormFieldWrapper(content: {
                TextEditor(text: $validator.text).multilineTextAlignment(.leading)
            },validator: validator)
        }
    }
}
