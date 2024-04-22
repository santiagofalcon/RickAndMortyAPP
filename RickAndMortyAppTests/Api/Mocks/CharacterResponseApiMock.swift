//
//  CharacterResponseApiMock.swift
//  RickAndMortyAppTests
//
//  Created by santiago falcón on 22/4/24.
//

import Foundation
@testable import RickAndMortyApp

struct CharacterResponseApiMock: CharactersResponse {
    var info: Informat
    var results: [Charac]

    init(info: Informat, results: [Charac]) {
        self.info = info
        self.results = results
    }
}
