//
//  DetailCharacterPresenter.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 22/4/24.
//

import Foundation

class DetailCharacterPresenter: ObservableObject {
    @Published var character: Charac
    
    var view: DetailCharacterView?
    var interactor: DetailCharacterInteractorProtocol
    var storageManager: StorageManager
    
    init( interactor: DetailCharacterInteractorProtocol, storageManager: StorageManager) {
        self.interactor = interactor
        self.storageManager = storageManager
        character = interactor.getCharacter()
    }
}
