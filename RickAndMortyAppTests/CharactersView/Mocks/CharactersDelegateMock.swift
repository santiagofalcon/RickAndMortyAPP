//
//  CharactersDelegateMock.swift
//  RickAndMortyAppTests
//
//  Created by santiago falcón on 22/4/24.
//

import Foundation
@testable import RickAndMortyApp
import UIKit

class CharactersDelegateMock: CharactersCoordinatorDelegate {
    var goToDeatailScreenCalled = false

    func goToDetailScreen(character: Charac, sender: UIViewController) {
        goToDeatailScreenCalled = true
    }
}
