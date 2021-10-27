//
//  LoginView.swift
//  CleanArchDemo
//
//  Created by Frank Feng on 19/10/21.
//

import SwiftUI
import HoustonUI

struct LoginView: View {
    @Environment(\.appEnv) var appEnv: AppEnvironment
    @EnvironmentObject var appState: AppState
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            credentialEntry
                .navigationTitle("Login")
        }
    }
    
    var credentialEntry: some View {
        LazyVStack(alignment: .leading) {
            HTextField("Enter your username", text: $username, style: .regular) { _ in
                appEnv.interactors.loginInteractor.validateUsername(username)
            }
            if self.appState.loginStore.isUsernameValid == false {
                HText(text: "The username has to be alphanumeric.",
                      style: .supplementary,
                      textColor: Color.No.normal)
            }
            HTextField("Enter your password", text: $password, style: .regular) { _ in
                appEnv.interactors.loginInteractor.validatePassword(password)
            }
            
            if self.appState.loginStore.isPasswordValid == false {
                HText(text: "The password has to be alphanumeric.",
                      style: .supplementary,
                      textColor: Color.No.normal)
            }
            Button {
                appEnv.interactors.loginInteractor.login()
            } label: {
                HStack {
                    Spacer()
                    Text("Login")
                    Spacer()
                }
            }
            .disabled(!(self.appState.loginStore.isUsernameValid && self.appState.loginStore.isPasswordValid))
            .buttonStyle(HButtonStyle.primary)

            NavigationLink(isActive: $appState.loginStore.isLoggedIn) {
                UserListView()
            } label: {
                EmptyView()
            }

        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
