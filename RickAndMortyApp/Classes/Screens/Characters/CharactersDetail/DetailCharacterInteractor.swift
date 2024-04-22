//
//  DetailCharacterInteractor.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 22/4/24.
//

import Foundation

internal final class DetailCharacterInteractor {
    
    var character: Charac
    
    init(character: Charac) {
        self.character = character
    }
}

extension DetailCharacterInteractor: DetailCharacterInteractorProtocol {
    func getCharacter() -> Charac {
        return character
    }
}
