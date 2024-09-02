//
//  JSONMockClient.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 02/09/24.
//

import Foundation

public protocol JSONMockClient {
    func loadJSON<Response: Decodable>(filename: String) -> Response
}

public extension JSONMockClient {
    func loadJSON<Response: Decodable>(filename: String) -> Response {
        guard let path = Bundle.main.url(forResource: filename, withExtension: "json") else {
            fatalError("Failed to load JSON")
        }

        do {
            let data = try Data(contentsOf: path)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .iso8601

            return try decoder.decode(Response.self, from: data)

        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
