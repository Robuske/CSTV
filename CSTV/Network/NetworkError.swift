//
//  NetworkError.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 02/09/24.
//

import Foundation

public enum NetworkError: String {
    case invalidURL
    case invalidResponse
    case unauthorized
    case unexpectedStatusCode
}

// TODO: Improve error handling
extension NetworkError: LocalizedError {
    public var failureReason: String? {
        rawValue
    }

}
