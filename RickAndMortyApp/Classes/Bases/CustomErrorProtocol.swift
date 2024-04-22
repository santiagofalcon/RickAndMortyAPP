//
//  CustomErrorProtocol.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 21/4/24.
//

import Foundation
protocol CustomErrorProtocol: LocalizedError {
    var title: String? {get}
    var code: Int {get}
    
}

struct CustomError: CustomErrorProtocol {
    var title: String?
    
    var code: Int
    
    var errorDescription: String?
        
    init(title: String?, description: String, code: Int){
        self.title = title
        self.code = code
        errorDescription = description
    }
}
