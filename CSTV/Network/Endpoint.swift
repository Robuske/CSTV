//
//  Endpoint.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 02/09/24.
//

import Foundation

public protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: String { get }
    var header: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
}
