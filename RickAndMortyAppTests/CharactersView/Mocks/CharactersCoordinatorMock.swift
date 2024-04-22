//
//  CharactersCoordinatorMock.swift
//  RickAndMortyAppTests
//
//  Created by santiago falcón on 22/4/24.
//

import Foundation
@testable import RickAndMortyApp
import UIKit

class CharactersCoordinatorMock: CharactersCoordinatorDelegate {
    var funGoToDetailScreenCalled = false
    func goToDetailScreen(character: Charac, sender: UIViewController) {
        funGoToDetailScreenCalled = true
    }
}
