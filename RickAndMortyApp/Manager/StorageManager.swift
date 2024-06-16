//
//  StorageManager.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 22/4/24.
//

import Foundation
import UIKit

protocol StorageManagerProtocol {
    func saveObject<T: Encodable>(object: T, filename: String) throws
    func getObject<T: Decodable>(filename: String) throws -> T

    func getCharacter() -> [Charac]?
    func saveCharacter(character: [Charac])

    func getCharacterImage(characterId: Int) -> UIImage?
    func saveCharacterImage(image: UIImage, characterId: Int)
}

struct StorageManager: StorageManagerProtocol {
    // MARK: Abstracted Storage

    static let shared = StorageManager()

    func saveObject<T: Encodable>(object: T, filename: String) throws {
        let objectData = try JSONEncoder().encode(object)

        let cachesDirectory = getCachesDirectory()
        let storageURL = cachesDirectory.appendingPathComponent(filename,
                                                                isDirectory: false)
        try objectData.write(to: storageURL)
    }

    func getObject<T: Decodable>(filename: String) throws -> T {
        let cachesDirectory = getCachesDirectory()
        let storageURL = cachesDirectory.appendingPathComponent(filename,
                                                                isDirectory: false)

        let objectData = try Data(contentsOf: storageURL)
        let object = try JSONDecoder().decode(T.self, from: objectData)

        return object
    }

    // MARK: Object Storage

    func getCharacter() -> [Charac]? {
        do {
            let character: [CharactersApi] = try getObject(filename: "peopleCache.json")
            return character
        } catch let error {
            print("Error retrieving data from cache: \(error.localizedDescription)")
        }

        return nil
    }

    func saveCharacter(character: [Charac]) {
        guard let characterObj = character as? [CharactersApi] else {
            return
        }
        do {
            try saveObject(object: characterObj, filename: "peopleCache.json")
        } catch let saveError {
            print("Error saving character to cache: \(saveError.localizedDescription)")
        }
    }

    func getCharacterImage(characterId: Int) -> UIImage? {
        do {
            let imageData: Data = try getObject(filename: "\(characterId)ImageCache.jpg")
            return UIImage(data: imageData)
        } catch let getError {
            print("Error retrieving character image from cache: \(getError.localizedDescription)")
            return nil
        }
    }

    func saveCharacterImage(image: UIImage, characterId: Int) {
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            do {
                try saveObject(object: imageData, filename: "\(characterId)ImageCache.jpg")
            } catch let saveError {
                print("Error saving character image to cache: \(saveError.localizedDescription)")
            }
        }
    }
    
    func removeCharacter(characterId: Int) {
        do {
            var characters: [CharactersApi] = try getObject(filename: "peopleCache.json")
            characters.removeAll { $0.id == characterId }
            try saveObject(object: characters, filename: "peopleCache.json")
        } catch let error {
            print("Error removing character from cache: \(error.localizedDescription)")
        }
    }
 // MARK: Path Function

    func getCachesDirectory() -> URL {
        let paths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)

        return paths[0]
    }
}
