//
//  CharactersInteractorTests.swift
//  RickAndMortyAppTests
//
//  Created by santiago falcón on 22/4/24.
//

import XCTest
@testable import RickAndMortyApp

class CharactersInteractorTests: XCTestCase {
    var sut: CharactersInteractor!
    var serviceMock: CharactersServiceMock!
    var presenterMock: CharactersPresenterMock!
    override func setUp() {
        super.setUp()

        createSut()
    }

    func createSut() {
        serviceMock = CharactersServiceMock()
        presenterMock = CharactersPresenterMock()
        sut = CharactersInteractor(charactersService: serviceMock)
    }

    override func tearDown() {
        super.tearDown()

        releaseSut()
    }

    func releaseSut() {
        serviceMock = nil
        presenterMock = nil
        sut = nil
    }

    func testGetCharactersResult() {
        let expected = true
        sut.getCharactersResult(firstURL: "") { (_: Result<CharactersResponse, Error>) in
            XCTAssertEqual(self.serviceMock.getCharactersWasCalled, expected)
        }
    }
}

