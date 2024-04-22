//
//  CharacterServiceApiTests.swift
//  RickAndMortyAppTests
//
//  Created by santiago falcón on 22/4/24.
//

@testable import RickAndMortyApp
import Foundation
import XCTest

final class CharactersServiceApiTests: XCTestCase {
    var sut: CharactersServiceApi!
    var apiManagerMock: ApiManagerMock!

    override func setUp() {
        super.setUp()
        createSut()
    }

    override func tearDown() {
        super.tearDown()
        releaseSut()
    }

    func createSut() {
        apiManagerMock = ApiManagerMock()
        sut = CharactersServiceApi(apiManager: apiManagerMock)
    }

    func releaseSut() {
        sut = nil
    }

    func testSutNotNil() {
        XCTAssertNotNil(sut)
    }

    func testGetCharactersWasCalledCalled() {
        sut.getCharactersResult(firstURL: "") { (_: Result<CharactersResponse, Error>) in
            XCTAssertTrue(self.apiManagerMock.apiCallWasCalled)
            XCTAssertFalse(self.apiManagerMock.showErrorCalled)
            XCTAssertTrue(self.apiManagerMock.showErrorNotCalled)
        }
    }

    func testGetCharactersError() {
        apiManagerMock.showError = true

        sut.getCharactersResult(firstURL: "") { (_: Result<CharactersResponse, Error>) in
            XCTAssertTrue(self.apiManagerMock.apiCallWasCalled)
            XCTAssertTrue(self.apiManagerMock.showErrorCalled)
            XCTAssertFalse(self.apiManagerMock.showErrorNotCalled)
        }
    }
}

