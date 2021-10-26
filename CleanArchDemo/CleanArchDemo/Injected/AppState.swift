//
//  AppState.swift
//  CleanArchDemo
//
//  Created by Frank Feng on 18/10/21.
//

import Foundation
import Combine

class AppState: ObservableObject {
    //@Published var currentUser = User()
    @Published var users: [User] = []
}
