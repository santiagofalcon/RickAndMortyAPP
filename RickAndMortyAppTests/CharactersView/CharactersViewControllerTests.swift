//
//  CharactersViewControllerTests.swift
//  RickAndMortyAppTests
//
//  Created by santiago falcón on 22/4/24.
//

import Foundation
import XCTest
@testable import RickAndMortyApp

final class CharactersViewControllerTests: XCTestCase {
    var sut: CharactersViewController!
    var presenterMock: CharactersPresenterMock!
    var delegateMock: CharactersDelegateMock!

    override func setUp() {
        super.setUp()
        createSut()
    }

    override func tearDown() {
        super.tearDown()
        releaseSut()
    }

    func createSut() {
        presenterMock = CharactersPresenterMock()

        delegateMock = CharactersDelegateMock()
        sut = CharactersViewController(presenter: presenterMock)

        sut.delegate = delegateMock
    }

    func releaseSut() {
        sut = nil
        presenterMock = nil
        delegateMock = nil
    }

    func testSutNotNil() {
        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.presenter)
    }

    func testInitController() {
        _ = sut.view
        XCTAssertTrue(presenterMock.funcViewDidLoadWasCalledCalled)
        XCTAssertFalse(presenterMock.funcViewAppearWasCalledCalled)
    }

    func testTableView() {
        _ = sut.view
        let tableView = sut.tableViewCharacters
        let numSut = sut.tableView(tableView!, numberOfRowsInSection: TestConstants.testInt)
        let numTest = presenterMock.getCharactersCount()

        XCTAssertEqual(numSut, numTest)
    }

    func testTableViewCellRowAt() {
        _ = sut.view
        let tableView = sut.tableViewCharacters
        let cell = sut.tableView(tableView!, cellForRowAt: TestConstants.indexPath) as? CustomCellCharacter
        let expected = "test"

        XCTAssertEqual(cell?.characterName.text, expected)
    }

    func testTableViewRowAt() {
        _ = sut.view
        let tableView = sut.tableViewCharacters

        sut.tableView(tableView!, didSelectRowAt: TestConstants.indexPath)
        XCTAssertTrue(delegateMock.goToDeatailScreenCalled)
    }
    
    func testTrailingSwipeActionsConfiguration() {
        _ = sut.view

        let tableView = sut.tableViewCharacters!

        let swipeActionsConfiguration = sut.tableView(tableView, trailingSwipeActionsConfigurationForRowAt: TestConstants.indexPath )
        XCTAssertNotNil(swipeActionsConfiguration)

        let actions = swipeActionsConfiguration?.actions ?? []
        XCTAssertEqual(actions.count, 1)
        XCTAssertEqual(actions.first?.title, "Delete")

        if let deleteAction = actions.first {
            let completionHandler: (Bool) -> Void = { success in
                XCTAssertTrue(success)
            }
            deleteAction.handler(deleteAction, UIView(), completionHandler)

            XCTAssertTrue(presenterMock.removeCharacterWasCalled)
            XCTAssertEqual(presenterMock.removedCharacterIndexWasCalled, TestConstants.indexPath .row)
        }
    }

    func testSearchBar() {
        _ = sut.view
        let searchBar = sut.searchCharacterBar
        searchBar?.delegate?.searchBar?(searchBar!, textDidChange: "Rick")

        XCTAssertTrue(presenterMock.funcFilterCharacterWasCalled)
    }

    func testWillDisplay() {
        _ = sut.view
        let tableView = sut.tableViewCharacters

        sut.tableView(tableView!, willDisplay: TestConstants.testCell, forRowAt: TestConstants.indexPath)
        XCTAssertTrue(presenterMock.funcGetCharacterCountWasCalled)
    }
}

