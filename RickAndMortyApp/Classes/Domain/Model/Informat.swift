//
//  Informat.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 21/4/24.
//

import Foundation

protocol Informat {
    var count: Int {get}
    var pages: Int {get}
    var next: String? {get}
    var prev: String? {get}
}
