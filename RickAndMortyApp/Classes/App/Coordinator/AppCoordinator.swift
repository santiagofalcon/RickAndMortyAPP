//
//  AppCoordinator.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 21/4/24.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var window: UIWindow
    
    lazy var navigationController: UINavigationController = {
        getNavigation()
    }()
    
    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    private func getNavigation() -> UINavigationController {
        let navigator = UINavigationController()
        
        return navigator
    }
    
    func showHome(){
        let coordinator = CharactersCoordinator()
        let interactor = CharactersInteractor()
        let presenter = CharactersPresenter(interactor: interactor)
        let view = CharactersViewController(presenter: presenter)
        
        view.delegate = coordinator
        presenter.view = view

        navigationController.setViewControllers([view], animated: true)

    }
    
    func start() {
        showHome()
    }
}
