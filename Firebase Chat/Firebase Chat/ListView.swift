//
//  ContentView.swift
//  Firebase Chat
//
//  Created by Nikhil on 31/12/22.
//

import SwiftUI

struct ListView: View {
    
    var viewModel = UsersListViewModel()
    
    var body: some View {
        
        List {
            ForEach(viewModel.usersList) { user in
                Text(user.name)
            }
        }
    }
}


struct ListView_Preview: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
