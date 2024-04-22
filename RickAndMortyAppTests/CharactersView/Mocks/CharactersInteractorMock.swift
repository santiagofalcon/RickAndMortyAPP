//
//  CharactersInteractorMock.swift
//  RickAndMortyAppTests
//
//  Created by santiago falcón on 22/4/24.
//

import Foundation
import UIKit
@testable import RickAndMortyApp

class CharactersInteractorMock: CharactersInteractorProtocol {

    var funcGetDataWasCalled = false
    var showError = false
    var showErrorCalled = false

    func getCharactersResult(firstURL: String,
                         completion: @escaping (Result<CharactersResponse, Error>) -> Void) {
        funcGetDataWasCalled = true
        if showError {
            showErrorCalled = true
            completion(.failure(TestConstants.errorTest))
        } else {
            showErrorCalled = false
            completion(.success(TestConstants.testResponseCharacter))
        }
    }
}
