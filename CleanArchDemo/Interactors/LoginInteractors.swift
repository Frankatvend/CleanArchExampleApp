//
//  LoginInteractors.swift
//  CleanArchDemo
//
//  Created by Frank Feng on 19/10/21.
//


protocol LoginInteractors: AnyObject {
    func validateUsername(_ text: String)
    func validatePassword(_ text: String)
    func login()
}

class RealLoginInteractors: LoginInteractors {

    var store: LoginStore

    init(store: LoginStore) {
        self.store = store
    }
    
    func validateUsername(_ text: String) {
        store.isUsernameValid = isAlphanumeric(text)
    }
    
    func validatePassword(_ text: String) {
        store.isPasswordValid = isAlphanumeric(text)
    }
    
    private func isAlphanumeric(_ text: String) -> Bool {
        return !text.isEmpty && (text.range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil)
    }
    
    func login() {
        store.isLoggedIn = true
    }
}

class MockLoginInteractors: LoginInteractors {
    
    func validatePassword(_ text: String) {
        
    }
    
    func validateUsername(_ text: String) {
        
    }
    
    func login() {
        
    }
}
