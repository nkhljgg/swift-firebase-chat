//
//  UsersListViewModel.swift
//  Firebase Chat
//
//  Created by Nikhil on 31/12/22.
//

import Foundation
import Combine
import SwiftUI

class UsersListViewModel: ObservableObject {
    
    var usersList: [User] = [.init(id: 1, name: "Nikhil"),
                             .init(id: 2, name: "Anchal"),
                             .init(id: 3, name: "Shaurya")]
    
}
