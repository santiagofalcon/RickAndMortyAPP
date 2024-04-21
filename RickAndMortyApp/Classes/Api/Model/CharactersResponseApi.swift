//
//  CharactersResponseApi.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 21/4/24.
//

import Foundation

struct CharactersResponseApi: CharactersResponse, Codable {
    
//    var info: Informat {castInformat}
    var results: [Charac] {castResult}
    
//    private let castInformat:
    private let castResult: [CharactersApi]
    
    enum CodingKeys: String, CodingKey {
        
        case results
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        castResult = try values.decode([CharactersApi].self, forKey: .results)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(castResult, forKey: .results)
    }
}
