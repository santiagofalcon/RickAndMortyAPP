//
//  CharactServiceContract.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 21/4/24.
//

import Foundation

protocol CharactServiceContract {
    func getCharactersResult(completion: @escaping (Result<[Charac], Error>) -> Void)
}
