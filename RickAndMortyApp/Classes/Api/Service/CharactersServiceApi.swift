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
    
//    func getCharactersResult(completion: @escaping (Result<[Charac], Error>) -> Void) {
//        guard let url = URL(string: CallsConstants.characFirtCall) else { return }
//        
//        let urlSession = URLSession.shared
//        urlSession.dataTask(with: url) {(data, response, error) in
//            if let error {
//                completion(.failure(error))
//                return
//            }
//            
//            if let data {
//                do {
//                    let apiResults = try JSONDecoder().decode(CharactersResponseApi.self,
//                                                              from: data)
//                    completion(.success(apiResults.results))
//                } catch let decodeError {
//                    completion(.failure(decodeError))
//                }
//            }
//        }.resume()
//    }

