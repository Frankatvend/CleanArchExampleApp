//
//  UserAPI.swift
//  CleanArchDemo
//
//  Created by Frank Feng on 26/10/21.
//

import Foundation
import Combine

protocol UserAPI {
    func fetchUsers() -> AnyPublisher<[User], Error>
}

struct RealUserAPI: UserAPI {
    func fetchUsers() -> AnyPublisher<[User], Error> {
        Just([User(id: UUID(), username: "test1", password: ""),
              User(id: UUID(), username: "test2", password: ""),
              User(id: UUID(), username: "test3", password: "")])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

struct MockUserAPI: UserAPI {
    func fetchUsers() -> AnyPublisher<[User], Error> {
        Just([User(id: UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5D")!, username: "test1", password: ""),
              User(id: UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5E")!, username: "test2", password: ""),
              User(id: UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")!, username: "test3", password: "")])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
