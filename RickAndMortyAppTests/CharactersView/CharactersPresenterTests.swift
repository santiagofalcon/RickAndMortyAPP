//
//  CharactersPresenterTests.swift
//  RickAndMortyAppTests
//
//  Created by santiago falcón on 22/4/24.
//

import Foundation
import XCTest
@testable import RickAndMortyApp

class CharactersPresenterTests: XCTestCase {
    var sut: CharactersPresenter!
    var interactorMock: CharactersInteractorMock!
    var viewMock: CharactersViewMock!

    override func setUp() {
        super.setUp()
        createSut()
    }

    override func tearDown() {
        super.tearDown()
        releaseSut()
    }

    func createSut() {
        interactorMock = CharactersInteractorMock()
        viewMock = CharactersViewMock()
        sut = CharactersPresenter(interactor: interactorMock)

        sut.view = viewMock
    }

    func releaseSut() {
        sut = nil
        interactorMock = nil
        viewMock = nil
    }

    func testSutNotNil() {
        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.interactor)
    }

    func testGetCharactersSuccess() {
        _ = sut.view
        sut.getCharacters()
        XCTAssertTrue(interactorMock.funcGetDataWasCalled)
    }

    func testGetCharactersFailure() {
        _ = sut.view
        sut.getCharacters()
        interactorMock.showError = true
        XCTAssertTrue(interactorMock.funcGetDataWasCalled)
    }

    func testGetCharactersCount() {
        sut.getCharacters()
        let count = sut.getCharactersCount()
        let expected = 1

        XCTAssertEqual(count, expected)
    }

    func testCharactersAtIndex() {
        sut.characters = TestConstants.testArrayPeople
        let result = sut.charactersAtIndex(index: 0)
        XCTAssertNotNil(result)
        XCTAssertEqual(result.id, TestConstants.testArrayPeople[0].id)
        XCTAssertEqual(result.name, TestConstants.testArrayPeople[0].name)
    }
}
