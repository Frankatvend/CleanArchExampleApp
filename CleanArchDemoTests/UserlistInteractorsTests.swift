//
//  UserlistInteractorsTests.swift
//  CleanArchDemoTests
//
//  Created by Frank Feng on 26/10/21.
//

import XCTest
@testable import CleanArchDemo

class UserlistInteractorsTests: XCTestCase {
    
    var appState: AppState!
    var interactor: RealUserlistInteractors!
    
    override func setUp() {
        appState = AppState()
        interactor = RealUserlistInteractors(appState: appState, API: MockUserAPI())
    }

    func testDeleteUser_exist_shouldSuccess() {
        interactor.fetchUsers()
        interactor.deleteUserAt(IndexSet(integer: 0))
        
        let expectedUserlist = [User(id: UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5E")!, username: "test2", password: ""),
                                User(id: UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")!, username: "test3", password: "")]
        XCTAssertEqual(appState.users, expectedUserlist)
    }
    
    func testDeleteUser_notExist_shouldNotChange() {
        interactor.fetchUsers()
        interactor.deleteUserAt(IndexSet(integer: 5))
        
        let expectedUserlist = [User(id: UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5D")!, username: "test1", password: ""),
                                User(id: UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5E")!, username: "test2", password: ""),
                                User(id: UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")!, username: "test3", password: "")]
        XCTAssertEqual(appState.users, expectedUserlist)
    }

}
