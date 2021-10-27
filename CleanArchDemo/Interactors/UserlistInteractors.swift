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

    private var store: UserStore
    private let API: UserAPI
    private var doggeBag: Set<AnyCancellable> = []
    
    init(store: UserStore, API: UserAPI) {
        self.store = store
        self.API = API
    }
    
    func fetchUsers() {
        API.fetchUsers()
            .sink(receiveCompletion: { error in
                //TODO: Handle error
            }, receiveValue: {[weak self] users in
                self?.store.users = users
            })
            .store(in: &doggeBag)
    }
    
    func deleteUserAt(_ index: IndexSet) {
        store.users.remove(atOffsets: index)
    }
    
}

class MockUserlistInteractors: UserlistInteractors {
    
    func fetchUsers() {
        
    }
    
    func deleteUserAt(_ index: IndexSet) {
        
    }
}
