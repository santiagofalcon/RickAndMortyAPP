//
//  AlertCustom.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 22/4/24.
//

import Foundation
import UIKit

protocol ShowAlertProtocol {
    func showAlertView(title: String, message: String, button1Text: String, parent: UIViewController)
}

struct ShowAlert: ShowAlertProtocol {
    func showAlertView(title: String, message: String, button1Text: String, parent: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let btnTryAgain = UIAlertAction(title: button1Text,
                                        style: .default)

        alertController.addAction(btnTryAgain)
        parent.present(alertController, animated: true)
    }
}
