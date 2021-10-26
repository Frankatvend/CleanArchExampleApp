//
//  LoginInteractors.swift
//  CleanArchDemo
//
//  Created by Frank Feng on 19/10/21.
//


protocol LoginInteractors: AnyObject {
    func isAlphanumeric(_ text: String) -> Bool
    func updateUsername(_ username: String)
}

class RealLoginInteractors: LoginInteractors {

    let appState: AppState
    
    init(appState: AppState) {
        self.appState = appState
    }
    
    func isAlphanumeric(_ text: String) -> Bool {
        return !text.isEmpty && (text.range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil)
    }
    
    func updateUsername(_ username: String) {
//        appState.currentUser.username = username
    }
}

class MockLoginInteractors: LoginInteractors {
    
    func updateUsername(_ username: String) {
        
    }
    
    func isAlphanumeric(_ text: String) -> Bool {
        return true
    }
}
