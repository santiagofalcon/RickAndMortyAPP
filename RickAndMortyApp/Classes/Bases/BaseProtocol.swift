//
//  BaseProtocol.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 21/4/24.
//

import Foundation

@objc protocol BaseProtocol {
    @objc optional func showError(message: String)
}
