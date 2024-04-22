//
//  CharacterApiMock.swift
//  RickAndMortyAppTests
//
//  Created by santiago falcón on 22/4/24.
//

import Foundation
@testable import RickAndMortyApp

struct CharacterApiMock: Charac {
    var id: Int
    var name: String
    var created: String
    var characterId: Int
    var status: Status
    var species: String
    var type: String
    var gender: Gender
    var origin: Origin
    var location: LocationOfCharacter
    var image: String?
    var episodes: [URL]
    var characterURL: URL
    
    init(
         id: Int,
         name: String,
         created: String,
         characterId: Int,
         status: Status,
         species: String,
         type: String,
         gender: Gender,
         origin: Origin,
         location: LocationOfCharacter,
         image: String,
         episodes: [URL],
         characterURL: URL) {
             
        self.id = id
        self.name = name
        self.created = created
        self.characterId = characterId
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episodes = episodes
        self.characterURL = characterURL
    }
}
