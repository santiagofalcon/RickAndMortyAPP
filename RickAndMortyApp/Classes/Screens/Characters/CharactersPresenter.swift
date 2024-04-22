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
    
    var url = CallsConstants.characFirtCall
    
    var storageManager: StorageManager
    var next = true
    
    init(interactor: CharactersInteractorProtocol, storageManager: StorageManager = StorageManager.shared) {
        self.interactor = interactor
        self.storageManager = storageManager
    }
    
    func getCharacters() {
        interactor.getCharactersResult(firstURL: url) { result in
            switch result {
            case let .success(characterRetrieved):
                self.view?.loadingView(.show)
                let characterCall = characterRetrieved.results
                self.characters.append(contentsOf: characterCall)
                self.storageManager.saveCharacter(character: self.characters)
                self.view?.loadCharacters()
                self.view?.loadingView(.hide)
                if let nextUrl = characterRetrieved.info.next {
                    self.url = nextUrl
                } else {
                    self.next = false
                }
            case let .failure(error):
                if let apiResults = self.storageManager.getCharacter() {
                    self.next = false
                    self.characters = apiResults
                    self.view?.loadCharacters()
                    self.view?.showError(title: CallsConstants.errorTitleCheckConnection,
                                         message: error.localizedDescription)
                } else {
                    self.view?.showError(title: CallsConstants.errorGeneralNoConnection,
                                         message: CallsConstants.errorMessageNoCache)
                }
            }
        }
    }
    
    func viewDidLoadWasCalled() {
        getCharacters()
    }

    func getCharactersCount() -> Int {
        return characters.count
    }
    
    func charactersAtIndex(index: Int) -> Charac {
        return self.characters[index]
    }
    
    func checkNextCall() -> Bool {
        return next
    }
}
