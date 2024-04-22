//
//  InformatMock.swift
//  RickAndMortyAppTests
//
//  Created by santiago falcón on 22/4/24.
//

import Foundation
@testable import RickAndMortyApp

struct InformatMock: Informat {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?

    init(count: Int, pages: Int, next: String?, prev: String?) {
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }
}
