//
//  MatchDetails+Service.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 02/09/24.
//

import Foundation

struct MatchesDetailsResponse: Decodable {
    let id: UInt
    let players: [Player]

    struct Player: Decodable {
        let firstName: String?
        let id: UInt
        let imageUrl: URL?
        let lastName: String?
        let name: String
    }
}

protocol MatchDetailsServiceable {
    func getTeamsDetails(leftID: UInt, rightID: UInt) async throws -> [MatchesDetailsResponse]
}

extension MatchDetails {
    struct Service: HTTPClient, MatchDetailsServiceable {
        func getTeamsDetails(leftID: UInt, rightID: UInt) async throws -> [MatchesDetailsResponse] {
            try await request(endpoint: PandaEndpoint.teamsDetails(leftID: leftID, rightID: rightID))
        }
    }

    struct MockService: JSONMockClient, MatchDetailsServiceable {
        func getTeamsDetails(leftID: UInt, rightID: UInt) async throws -> [MatchesDetailsResponse] {
            loadJSON(filename: "teams")
        }
    }
}
