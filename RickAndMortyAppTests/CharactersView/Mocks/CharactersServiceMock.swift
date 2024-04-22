//
//  CharactersServiceMock.swift
//  RickAndMortyAppTests
//
//  Created by santiago falcón on 22/4/24.
//

import Foundation
@testable import RickAndMortyApp
import UIKit

class CharactersServiceMock: CharactersServiceProtocol {
    var getCharactersWasCalled = false

    func getCharactersService() -> any RickAndMortyApp.CharactersServiceContract {
        getCharactersWasCalled = true
        return CharacterServiceApiMock()
    }
}
