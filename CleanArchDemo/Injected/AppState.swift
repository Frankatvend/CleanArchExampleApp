//
//  AppState.swift
//  CleanArchDemo
//
//  Created by Frank Feng on 18/10/21.
//

import Foundation
import Combine

class AppState: ObservableObject {
    @Published var userStore: UserStore = UserStore()
    @Published var loginStore: LoginStore = LoginStore()
}

struct LoginStore {
    var isUsernameValid: Bool = true
    var isPasswordValid: Bool = true
    var isLoggedIn: Bool = false
}

struct UserStore {
    var users: [User] = []
}
