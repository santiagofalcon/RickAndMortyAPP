//
//  DetailCharacterContract.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 22/4/24.
//

import Foundation
import UIKit

protocol DetailCharacterViewProtocol: BaseProtocol {
    func loadCharacterInfo(character: Charac)
}

protocol DetailCharacterPresenterProtocol {
    var view: DetailCharacterViewProtocol? { get set }

    func viewDidLoadWasCalled()
}

protocol DetailCharacterInteractorProtocol {
    func getCharacter() -> Charac
}
