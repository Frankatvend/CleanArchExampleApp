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
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isUsernameValid: Bool = false
    @State private var isPasswordValid: Bool = false
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            credentialEntry
                .navigationTitle("Login")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Next") {
                            isLoggedIn = true
                        }
                        .disabled(!(isUsernameValid && isPasswordValid))
                    }
                }
            
        }
        .fullScreenCover(isPresented: $isLoggedIn) {
            UserListView()
        }
    }
    
    var credentialEntry: some View {
        LazyVStack(alignment: .leading) {
            HTextField("Enter your username", text: $username, style: .regular) { _ in
                isUsernameValid = appEnv.interactors.loginInteractor.isAlphanumeric(username)
            }
            if isUsernameValid == false {
                HText(text: "The username has to be alphanumeric.",
                      style: .supplementary,
                      textColor: Color.No.normal)
            }
            HTextField("Enter your password", text: $password, style: .regular) { _ in
                isPasswordValid = appEnv.interactors.loginInteractor.isAlphanumeric(password)
            }
            if isPasswordValid == false {
                HText(text: "The password has to be alphanumeric.",
                      style: .supplementary,
                      textColor: Color.No.normal)
            }
            Button {
                isLoggedIn = true
            } label: {
                HStack {
                    Spacer()
                    Text("Login")
                    Spacer()
                }
            }
            .disabled(!(isUsernameValid && isPasswordValid))
            .buttonStyle(HButtonStyle.primary)
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
