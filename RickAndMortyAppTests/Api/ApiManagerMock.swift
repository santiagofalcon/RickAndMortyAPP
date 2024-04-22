//
//  ApiManagerMock.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 22/4/24.
//

import Foundation
@testable import RickAndMortyApp

class ApiManagerMock: APIManagerProtocol {
    var showError = false
    var apiCallWasCalled = false
    var showErrorCalled = false
    var showErrorNotCalled = false

    func apiCall<T>(for url: String, completion: @escaping (Result<T, Error>) -> Void) where T: Decodable {
        apiCallWasCalled = true

        if showError {
            showErrorCalled = true
            completion(.failure(TestConstants.errorTest))
        }
    }
}
