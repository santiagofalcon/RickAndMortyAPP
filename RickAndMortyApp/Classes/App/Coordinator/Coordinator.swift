//
//  Coordinator.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 21/4/24.
//

import Foundation
import UIKit

public protocol Coordinator {
    
    var childCoordinators: [Coordinator] {get set}
    var tabBarController: UITabBarController {get set}
    
    func start()
}
