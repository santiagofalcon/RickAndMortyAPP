//
//  CharactersCoordinator.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 21/4/24.
//

import Foundation
import UIKit
import SwiftUI
class CharactersCoordinator: CharactersCoordinatorDelegate {
    let storageManager = StorageManager.shared

    func goToDetailScreen(character: Charac ,sender: UIViewController) {
        let interactor = DetailCharacterInteractor(character: character)
        let presenter = DetailCharacterPresenter(interactor: interactor, storageManager: storageManager)
        let view = DetailCharacterView(presenter: presenter)

        presenter.view = view

        sender.navigationController?.pushViewController(UIHostingController(rootView: view), animated: true)
    }
}
