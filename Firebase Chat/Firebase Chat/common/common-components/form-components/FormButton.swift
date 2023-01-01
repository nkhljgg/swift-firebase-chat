//
//  FormButton.swift
//  SwiftUI Utilities
//
//  Created by Nikhil on 01/01/23.
//

import Foundation
import SwiftUI

struct FormButton:View {
    
    var manager = AppearanceManager()
    var title:String
    var placeHolder:String
    var action:() -> Void
    
    var displayAdditionalInfo: (() -> Void)?
    var hasAdditionalInfo = false
    var additionalInfoText: String
    @Binding var showAdditionalInfo: Bool
    
    @ObservedObject var validator:FormTextModel
    
    init(title:String, placeholder:String,
         validator:FormTextModel,
         hasAdditionalInfo: Bool = false,
         displayAdditionalInfo: (() -> Void)? = nil,
         showInfo: Binding<Bool> = .constant(false),
         additionalInfoText: String = "",
         action:@escaping () -> Void) {
        self.title = title
        self.placeHolder = placeholder
        self.validator = validator
        self.action = action
     
        self.hasAdditionalInfo = hasAdditionalInfo
        self.displayAdditionalInfo = displayAdditionalInfo
        self._showAdditionalInfo = showInfo
        self.additionalInfoText = additionalInfoText
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.poppinsHeadline)
                    .foregroundColor(validator.color)
                if hasAdditionalInfo {
                    Button {
                        if let additionalInfoFunction = displayAdditionalInfo {
                            additionalInfoFunction()
                        }
                    } label: {
                        Image("info")
                    }.popover(isPresented: $showAdditionalInfo) {
                        PopupView(popupText: additionalInfoText).onTapGesture {
                            showAdditionalInfo.toggle()
                        }
                    }
                }
                Spacer()
            }
            
            FormFieldWrapper(content: {
                if validator.text == "" {
                    Text(placeHolder).foregroundColor(manager.theme.formPlaceHolderText)
                        .font(.poppins)
                        .frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
                } else {
                    Text(validator.text).lineLimit(nil)
                        .font(.poppins)
                        .foregroundColor(manager.theme.formControlText)
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
