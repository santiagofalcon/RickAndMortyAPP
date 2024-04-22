//
//  CharactServiceContract.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 21/4/24.
//

import Foundation

protocol CharactersServiceContract {
    func getCharactersResult(firstURL: String, completion: @escaping (Result<CharactersResponse, Error>) -> Void)}
