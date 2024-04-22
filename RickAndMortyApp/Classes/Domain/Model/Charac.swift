//
//  Charac.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 21/4/24.
//

import Foundation

protocol Charac {
    
    var id: Int {get}
    var name: String {get}
    var status: Status {get}
    var species: String {get}
    var type: String {get}
    var gender: Gender {get}
    var origin: Origin {get}
    var location: LocationOfCharacter {get}
    var image: String? {get}
    var episodes: [URL] {get}
    var characterURL: URL {get}
    var created: String {get}
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown
}

enum Gender: String, Codable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown
}

protocol Origin {
    var name: String { get }
    var url: String { get }
}

protocol LocationOfCharacter {
    var name: String { get }
    var url: String { get }
}
