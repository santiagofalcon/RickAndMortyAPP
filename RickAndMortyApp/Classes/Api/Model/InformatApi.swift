//
//  InformatApi.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 22/4/24.
//

import Foundation
struct InformatApi: Informat, Codable{
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
    
    enum CodingKeys: String, CodingKey {
        case count
        case pages
        case next
        case prev
    }
}
