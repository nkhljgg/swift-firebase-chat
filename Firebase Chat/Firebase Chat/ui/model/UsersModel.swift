//
//  UsersModel.swift
//  Firebase Chat
//
//  Created by Nikhil on 31/12/22.
//

import Foundation

struct User: Identifiable, Hashable {
    
    var uuid = UUID()
    var id: String
    var name: String
    var email: String
    var image: String?
    
}
