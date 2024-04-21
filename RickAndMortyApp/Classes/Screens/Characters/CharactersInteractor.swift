//
//  CharactersInteractor.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 21/4/24.
//

import Foundation

internal final class CharactersInteractor {
    private let charactersService: CharactersServiceProtocol
    
    init(charactersService: CharactersServiceProtocol = CharactersService()) {
        self.charactersService = charactersService
    }
}

extension CharactersInteractor: CharactersInteractorProtocol {
    
    func getCharactersResult(completion: @escaping (Result<[Charac], Error>) -> Void) {
        let charactersService = self.charactersService.getCharactersService()
        
        charactersService.getCharactersResult { result in
            completion(result)
        }
    }
}
