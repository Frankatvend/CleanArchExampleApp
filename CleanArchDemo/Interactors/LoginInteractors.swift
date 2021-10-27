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

    let appState: AppState
    
    init(appState: AppState) {
        self.appState = appState
    }
    
    func validateUsername(_ text: String) {
        appState.loginStore.isUsernameValid = isAlphanumeric(text)
    }
    
    func validatePassword(_ text: String) {
        appState.loginStore.isPasswordValid = isAlphanumeric(text)
    }
    
    private func isAlphanumeric(_ text: String) -> Bool {
        return !text.isEmpty && (text.range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil)
    }
    
    func login() {
        appState.loginStore.isLoggedIn = true
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
