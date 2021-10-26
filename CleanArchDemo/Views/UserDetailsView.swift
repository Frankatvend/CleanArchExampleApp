//
//  UserDetailsView.swift
//  CleanArchDemo
//
//  Created by Frank Feng on 25/10/21.
//

import SwiftUI

struct UserDetailsView: View {
    let user: User
    
    var body: some View {
        Text(user.username)
            .navigationTitle("User Details")
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView(user: User())
    }
}
