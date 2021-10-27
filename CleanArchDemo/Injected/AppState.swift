//
//  AppState.swift
//  CleanArchDemo
//
//  Created by Frank Feng on 18/10/21.
//

import Foundation
import Combine

class AppState: ObservableObject {
    @Published var users: [User] = []
    @Published var isUsernameValid: Bool = true
    @Published var isPasswordValid: Bool = true
    @Published var isLoggedIn: Bool = false
}
