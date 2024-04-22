//
//  CharactersPresenterMock.swift
//  RickAndMortyAppTests
//
//  Created by santiago falcón on 22/4/24.
//

import Foundation
@testable import RickAndMortyApp

class CharactersPresenterMock: CharactersPresenterProtocol {
    
    var character: [Charac] = []
    var view: CharactersViewProtocol?

    var funcViewDidLoadWasCalledCalled = false
    var funcViewAppearWasCalledCalled = false
    var funcEpisodeAtIndexWasCalled = false
    var callCharacterApiWasCalled = false
    var downloadCharacterImageHomeWasCalled = false
    var funcGetCharacterCountWasCalled = false
    var funcFilterCharacterWasCalled = false

    func viewDidLoadWasCalled() {
        funcViewDidLoadWasCalledCalled = true
    }

    func viewWillAppearWasCalled() {
        funcViewAppearWasCalledCalled = true
    }

    func getCharacters() {
        return callCharacterApiWasCalled = true
    }
    
    func getCharactersCount() -> Int {
        funcGetCharacterCountWasCalled = true
        return TestConstants.testArrayPeople.count
    }
    
    func charactersAtIndex(index: Int) -> any RickAndMortyApp.Charac {
        funcEpisodeAtIndexWasCalled = true
        return TestConstants.testArrayPeople[index]
    }
    
    func checkNextCall() -> Bool {
        return TestConstants.testBool
    }
    
    func downloadCharacterImage(_ characterAtIndex: any RickAndMortyApp.Charac, _ cell: RickAndMortyApp.CustomCellCharacter) {
        return downloadCharacterImageHomeWasCalled = true
    }
    
    func searchCharacter(with searchText: String) {
        funcFilterCharacterWasCalled = true
    }
}
