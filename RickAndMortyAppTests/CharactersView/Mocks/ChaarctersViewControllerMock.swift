//
//  ChaarctersViewControllerMock.swift
//  RickAndMortyAppTests
//
//  Created by santiago falcón on 22/4/24.
//

import Foundation
@testable import RickAndMortyApp

class CharactersViewMock: CharactersViewProtocol {

    var funcLoadCharacter = false
    var funcloadingViewCalled = false
    var funcShowErrorWasCalled = false

    func loadCharacters() {
        funcLoadCharacter = true
    }

    func loadingView(_ state: LoadingState) {
        funcloadingViewCalled = true
    }

    func showError(title: String, message: String) {
        funcShowErrorWasCalled = true
    }
}
