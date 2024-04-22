//
//  OriginApiMock.swift
//  RickAndMortyAppTests
//
//  Created by santiago falcón on 22/4/24.
//

import Foundation
@testable import RickAndMortyApp

struct OriginMock: Origin {
    var name: String
    var url: String

    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}
