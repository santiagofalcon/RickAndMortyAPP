//
//  CharacterServiceApiMock.swift
//  RickAndMortyAppTests
//
//  Created by santiago falcón on 22/4/24.
//

import Foundation
@testable import RickAndMortyApp

class CharacterServiceApiMock: CharactersServiceContract {
    func getCharactersResult(firstURL: String,
                             completion: @escaping (Result<CharactersResponse, Error>) -> Void) {
        completion(.success(TestConstants.testResponseCharacter))
    }
}
