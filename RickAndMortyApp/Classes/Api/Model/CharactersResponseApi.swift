//
//  CharactersResponseApi.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 21/4/24.
//

import Foundation

struct CharactersResponseApi: CharactersResponse, Codable {
    
    var info: Informat {castInformat}
    var results: [Charac] {castResult}
    
    private let castInformat: InformatApi
    private let castResult: [CharactersApi]
    
    enum CodingKeys: String, CodingKey {
        
        case info
        case results
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        castInformat = try values.decode(InformatApi.self, forKey: .info)
        castResult = try values.decode([CharactersApi].self, forKey: .results)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(castInformat, forKey: .info)
        try container.encode(castResult, forKey: .results)
    }
}
