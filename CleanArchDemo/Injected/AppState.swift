//
//  AppState.swift
//  CleanArchDemo
//
//  Created by Frank Feng on 18/10/21.
//

import Foundation
import Combine

class AppState: ObservableObject {
    
    private var doggeBag: Set<AnyCancellable> = []
    
    @Published var userStore: UserStore = UserStore()
    @Published var loginStore: LoginStore = LoginStore()
    
    init() {
        loginStore.objectWillChange.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
        .store(in: &doggeBag)
        
        userStore.objectWillChange.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
        .store(in: &doggeBag)
    }
}

class LoginStore: ObservableObject {
    @Published var isUsernameValid: Bool = true
    @Published var isPasswordValid: Bool = true
    @Published var isLoggedIn: Bool = false
}

class UserStore: ObservableObject {
    @Published var users: [User] = []
}
