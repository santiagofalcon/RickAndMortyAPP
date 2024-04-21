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
    
    lazy var tabBarController: UITabBarController = {
        getNavigation()
    }()
    
    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = tabBarController
        self.window.makeKeyAndVisible()
    }
    
    private func getNavigation() -> UITabBarController {
        let navigator = UITabBarController()
        
        return navigator
    }
    
    func showHome(){
        let charactersView = getCharacters()
        charactersView.title = CallsConstants.characTitle
        charactersView.tabBarItem.image = CallsConstants.imageCharacter
        
        tabBarController.setViewControllers([charactersView], animated: true)
        
    }
    
    func start() {
        showHome()
    }
    
    func getCharacters() -> UINavigationController {
        let navigatorController = UINavigationController()
        let coordinator = CharactersCoordinator()
        let interactor = CharactersInteractor()
        let presenter = CharactersPresenter(interactor: interactor)
        let view = CharactersViewController(presenter: presenter)
        
        view.delegate = coordinator
        presenter.view = view
        navigatorController.setViewControllers([view], animated: true)
        return navigatorController
    }
}
