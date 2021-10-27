//
//  LoginInteractorsTests.swift
//  CleanArchDemoTests
//
//  Created by Frank Feng on 26/10/21.
//

import XCTest
@testable import CleanArchDemo

class LoginInteractorsTests: XCTestCase {
    
    var appState: AppState!
    var interactor: RealLoginInteractors!
    
    override func setUp() {
        appState = AppState()
        interactor = RealLoginInteractors(appState: appState)
    }

    func testisUsernameValid_emptyString_shouldBeFalse() {
        interactor.validateUsername("")
        XCTAssertFalse(interactor.appState.isUsernameValid)
    }
    
    func testisUsernameValid_letterOnly_shouldBeTrue() {
        interactor.validateUsername("letter")
        XCTAssertTrue(interactor.appState.isUsernameValid)
    }
    
    func testisUsernameValid_numberOnly_shouldBeTrue() {
        interactor.validateUsername("123")
        XCTAssertTrue(interactor.appState.isUsernameValid)
    }
    
    func testisUsernameValid_letterAndNumber_shouldBeTrue() {
        interactor.validateUsername("letter123")
        XCTAssertTrue(interactor.appState.isUsernameValid)
    }
    
    func testisUsernameValid_specialChars_shouldBeFalse() {
        interactor.validateUsername("letter123!@")
        XCTAssertFalse(interactor.appState.isUsernameValid)
    }

}
