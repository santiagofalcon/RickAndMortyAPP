//
//  TestConstants.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 22/4/24.
//

import Foundation
import UIKit
@testable import RickAndMortyApp

struct TestConstants {
    static let testInt = 1
    static let testString = "test"
    static let testBool = true
    static let testCell = UITableViewCell()
    
    static let indexPath = IndexPath(row: 0, section: 0)
    
    static let testPeople = CharacterApiMock(
        id: testInt,
        name: testString,
        created: testString,
        characterId: testInt,
        status: .alive,
        species: testString,
        type: testString,
        gender: .male,
        origin: OriginMock(name: testString, url: testString),
        location: LocationMock(name: testString, url: testString),
        image: testString,
        episodes: [URL(string: testString)!, URL(string: testString)!],
        characterURL: URL(string: testString)!
    )
    
    static let infoMock = InformatMock(count: 10, pages: 2, next: "URL_NEXT", prev: "URL_PREV")
    
    static let testArrayPeople = [testPeople]
    
    static let testResponseCharacter = CharacterResponseApiMock(info: infoMock, results: testArrayPeople)
    
    static let errorTest = CustomError(title: testString, description: testString, code: 0)
}
