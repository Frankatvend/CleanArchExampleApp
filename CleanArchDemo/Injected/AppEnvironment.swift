//
//  AppEnvironment.swift
//  CleanArchDemo
//
//  Created by Frank Feng on 19/10/21.
//

import Foundation
import SwiftUI

struct AppEnvironment: EnvironmentKey {
    let interactors: Interactors
    
    init(interactors: Interactors) {
        self.interactors = interactors
    }
    
    static var defaultValue: Self { Self.default }
    
    private static let `default` = Self(interactors: .stub)
}

extension EnvironmentValues {
    var appEnv: AppEnvironment {
        get { self[AppEnvironment.self] }
        set { self[AppEnvironment.self] = newValue }
    }
}

struct Interactors {
    let loginInteractor: LoginInteractors
    let userlistInteractor: UserlistInteractors
    
    init(loginInteractor: LoginInteractors, userlistInteractor: UserlistInteractors) {
        self.loginInteractor = loginInteractor
        self.userlistInteractor = userlistInteractor
    }
    
    static var stub: Self {
        .init(loginInteractor: MockLoginInteractors(), userlistInteractor: MockUserlistInteractors())
    }
}
