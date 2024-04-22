//
//  CharactersContract.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 21/4/24.
//

import Foundation
import UIKit

protocol CharactersViewProtocol: BaseProtocol {
    func loadCharacters()
    func loadingView(_ state: LoadingState)
}

enum LoadingState {
    case show
    case hide
}


protocol CharactersPresenterProtocol{
    var  view: CharactersViewProtocol? {get set}
    
    func getCharacters()
    
    func getCharactersCount()-> Int
    func charactersAtIndex(index: Int) -> Charac
}

protocol CharactersInteractorProtocol {
    func getCharactersResult(firstURL: String, completion: @escaping (Result<CharactersResponse, Error>) -> Void)
}

protocol CharactersServiceProtocol {
    func getCharactersService() -> CharactersServiceContract
}

protocol CharactersCoordinatorDelegate {
    func goToDetailScreen(character:Charac ,sender: UIViewController)
}
