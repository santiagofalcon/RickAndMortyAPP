//
//  CharactersService.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 21/4/24.
//

import Foundation

internal final class CharactersService: CharactersServiceProtocol {
    
    private let charactersService: CharactersServiceContract
    
    init(charactersService: CharactersServiceContract = CharactersServiceApi()) {
        self.charactersService = charactersService
    }
    
    func getCharactersService() -> CharactersServiceContract {
        return self.charactersService
    }

}
