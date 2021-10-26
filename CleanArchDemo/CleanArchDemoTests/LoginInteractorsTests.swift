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

    func testIsAlphanumeric_emptyString_shouldBeFalse() {
        XCTAssertFalse(interactor.isAlphanumeric(""))
    }
    
    func testIsAlphanumeric_letterOnly_shouldBeTrue() {
        XCTAssertTrue(interactor.isAlphanumeric("letter"))
    }
    
    func testIsAlphanumeric_numberOnly_shouldBeTrue() {
        XCTAssertTrue(interactor.isAlphanumeric("123"))
    }
    
    func testIsAlphanumeric_letterAndNumber_shouldBeTrue() {
        XCTAssertTrue(interactor.isAlphanumeric("letter123"))
    }
    
    func testIsAlphanumeric_specialChars_shouldBeFalse() {
        XCTAssertFalse(interactor.isAlphanumeric("letter123!@"))
    }

}
