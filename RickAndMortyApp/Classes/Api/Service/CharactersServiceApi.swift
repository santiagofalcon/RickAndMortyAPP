//
//  CharactersServiceApi.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 21/4/24.
//

import Foundation

public class CharactersServiceApi: CharactersServiceContract {
    
    var apiManager: APIManagerProtocol
    
    init(apiManager: APIManagerProtocol = ApiManager.shared) {
        self.apiManager = apiManager
    }
    
    func getCharactersResult(firstURL: String, completion: @escaping (Result<CharactersResponse, Error>) -> Void) {
        apiManager.apiCall(for: firstURL) { (result: Result<CharactersResponseApi, Error>) in
            switch result {
            case let .success(character):
                completion(.success(character))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

}
