//
//  LocationOfCharactersMock.swift
//  RickAndMortyAppTests
//
//  Created by santiago falcón on 22/4/24.
//

import Foundation
@testable import RickAndMortyApp

struct LocationMock: LocationOfCharacter {
    var name: String
    var url: String

    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}
