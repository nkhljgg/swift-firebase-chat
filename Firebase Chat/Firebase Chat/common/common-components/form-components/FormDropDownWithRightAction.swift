//
//  FormDropDownWithRightAction.swift
//  SwiftUI Utilities
//
//  Created by Nikhil on 01/01/23.
//

import Foundation
import SwiftUI

struct FormDropDownWithRightAction:View {
   
    var manager = AppearanceManager()
    var title:String
    var placeHolder:String
    var rightIcon: String
    var action:() -> Void
    var rightIconAction: () -> Void
    
    @ObservedObject var validator: FormTextModel
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.poppinsHeadline)
                    .frame(maxWidth:.infinity, alignment:.leading)
                    .foregroundColor(validator.color)
                Spacer()
                
                Button {
                    rightIconAction()

                } label: {
                    Image(uiImage: UIImage(named: rightIcon) ?? UIImage()).frame(width: 30, height: 30).clipped().aspectRatio(contentMode: .fit)
                }

            }
            FormFieldWrapper(content: {
                HStack {
                    if validator.text == "" {
                        Text(placeHolder)
                            .font(.poppins)
                            .foregroundColor(manager.theme.formPlaceHolderText)
                            .frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
                    } else {
                        Text(validator.text).lineLimit(nil)
                            .font(.poppins)
                            .foregroundColor(manager.theme.formControlText)
                            .frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                    }
                    Spacer()
                    Image(systemName: "arrowtriangle.down.fill")
                        .resizable()
                        .frame(width: 8, height: 8, alignment: .center)
                }
            }, validator: validator)
            .background(Color.white.opacity(0.01))
            .onTapGesture {
                action()
            }
            /*
             ### WORKAROUND: SwiftUI issue ###
             - Background is set with opacity 0.01 as a workaround for this issue
             - No TapGesture detected in Spacer inside HStack
             - I may try using ZStack later and see if solves the issue
             */
        }
    }
}
