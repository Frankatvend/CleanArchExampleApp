//
//  UserlistInteractors.swift
//  CleanArchDemo
//
//  Created by Frank Feng on 25/10/21.
//

import Foundation
import Combine

protocol UserlistInteractors: AnyObject {
    func fetchUsers()
    func deleteUserAt(_ index: IndexSet)
}

class RealUserlistInteractors: UserlistInteractors {

    let appState: AppState
    let API: UserAPI
    private var doggeBag: Set<AnyCancellable> = []
    
    init(appState: AppState, API: UserAPI) {
        self.appState = appState
        self.API = API
    }
    
    func fetchUsers() {
        API.fetchUsers()
            .sink(receiveCompletion: { error in
                //TODO: Handle error
            }, receiveValue: {[weak self] users in
                self?.appState.users = users
            })
            .store(in: &doggeBag)
    }
    
    func deleteUserAt(_ index: IndexSet) {
        appState.users.remove(atOffsets: index)
    }
    
}

class MockUserlistInteractors: UserlistInteractors {
    let appState: AppState
    let API: UserAPI
    
    init(appState: AppState, API: UserAPI) {
        self.appState = appState
        self.API = API
    }
    
    func fetchUsers() {
        
    }
    
    func deleteUserAt(_ index: IndexSet) {
        
    }
}
