//
//  CharactersPresenter.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 21/4/24.
//

import Foundation
internal final class CharactersPresenter: CharactersPresenterProtocol {
    
    var view: CharactersViewProtocol?
    var interactor: CharactersInteractorProtocol
    var characters = [Charac]()
    
    init(interactor: CharactersInteractorProtocol) {
        self.interactor = interactor
    }
    
    func getCharacters() {
        interactor.getCharactersResult { result in
            switch result {
            case.failure(let error):
                self.view?.showError?(message: error.localizedDescription)
            case.success(let character):
                self.characters.append(contentsOf: character)
                self.view?.loadCharacters()
            }
        }
    }
    
    func getCharactersCount() -> Int {
        return characters.count
    }
    
    func charactersAtIndex(index: Int) -> Charac {
        return self.characters[index]
    }
    
}
