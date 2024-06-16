//
//  CharactersPresenter.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 21/4/24.
//

import Foundation
import UIKit
internal final class CharactersPresenter: CharactersPresenterProtocol {

    var view: CharactersViewProtocol?
    var interactor: CharactersInteractorProtocol
    var characters = [Charac]()
    
    var url = CallsConstants.characFirtCall
    
    var storageManager: StorageManager
    var next = true
    
    var filterCharacter = false
    var filteredCharacter = [Charac]()
    
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
                    self.view?.loadingView(.hide)
                    self.view?.showError(title: CallsConstants.errorTitleCheckConnection,
                                         message: error.localizedDescription)
                } else {
                    self.view?.showError(title: CallsConstants.errorGeneralNoConnection,
                                         message: CallsConstants.errorMessageNoCache)
                }
            }
        }
    }
    
    func downloadCharacterImage(_ characterAtIndex: Charac, _ cell: CustomCellCharacter){
        if let cachedImage = storageManager.getCharacterImage(characterId: characterAtIndex.id) {
            cell.characterImage.image = cachedImage
        } else {
            if let imageUrlString = characterAtIndex.image, let imageUrl = URL(string: imageUrlString) {
                let task = URLSession.shared.dataTask(with: imageUrl) { data, _, error in
                    if error == nil, let data = data, let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            cell.characterImage.image = image

                            self.storageManager.saveCharacterImage(image: image, characterId: characterAtIndex.id)
                        }
                    } else {
                        DispatchQueue.main.async {
                            cell.characterImage.image = UIImage(systemName: "person.circle")?.withTintColor(.gray)
                        }
                        print("Error Downloading Image: \(error?.localizedDescription ?? "")")
                        self.view?.loadingView(.hide)
                    }
                }
                task.resume()
            }
        }
    }
    
    func searchCharacter(with searchText: String) {
        filterCharacter = !searchText.isEmpty

        if filterCharacter {
            filteredCharacter = characters.filter { character in
                character.name.lowercased().contains(searchText.lowercased())
            }
        }

        view?.loadCharacters()
    }
    
    func removeCharacter(at index: Int) {
        let character = charactersAtIndex(index: index)
        storageManager.removeCharacter(characterId: character.id)
        if filterCharacter {
            filteredCharacter.remove(at: index)
        } else {
            characters.remove(at: index)
        }
        view?.loadCharacters()
    }


    
    func viewDidLoadWasCalled() {
        getCharacters()
    }

    func getCharactersCount() -> Int {
        return filterCharacter ? filteredCharacter.count : characters.count
    }
    
    func charactersAtIndex(index: Int) -> Charac {
        return filterCharacter ? filteredCharacter[index] : characters[index]
    }
    
    func checkNextCall() -> Bool {
        return next
    }
}
