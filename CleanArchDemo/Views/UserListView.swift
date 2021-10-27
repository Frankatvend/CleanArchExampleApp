//
//  UserListView.swift
//  CleanArchDemo
//
//  Created by Frank Feng on 19/10/21.
//

import SwiftUI

struct UserListView: View {
    @Environment(\.appEnv) var appEnv: AppEnvironment
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        userlist
            .navigationTitle("Users")
            .onAppear {
                appEnv.interactors.userlistInteractor.fetchUsers()
            }
    }
    
    var userlist: some View {
        List {
            ForEach(appState.users) { user in
                NavigationLink(destination: UserDetailsView(user: user)) {
                    Text(user.username)
                }
            }
            .onDelete { index in
                appEnv.interactors.userlistInteractor.deleteUserAt(index)
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
