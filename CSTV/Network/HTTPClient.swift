//
//  HTTPClient.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 01/09/24.
//

import Foundation

public protocol HTTPClient {
    func request<Response: Decodable>(
        endpoint: Endpoint
    ) async throws -> Response
}

public extension HTTPClient {
    func request<Response: Decodable>(endpoint: Endpoint) async throws -> Response {
        let request = try buildURLRequest(endpoint: endpoint)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        switch response.statusCode {
        case 200 ... 299:
            return try decode(data: data)

        case 401:
            throw NetworkError.unauthorized

        default:
            throw NetworkError.unexpectedStatusCode
        }
    }

    private func buildURLRequest(endpoint: Endpoint) throws -> URLRequest {
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.host
        components.path = endpoint.path

        guard let url = components.url else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)

        request.httpMethod = endpoint.method
        request.allHTTPHeaderFields = endpoint.header

        return request
    }

    private func decode<Response: Decodable>(data: Data) throws -> Response {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return try decoder.decode(Response.self, from: data)
    }
}
