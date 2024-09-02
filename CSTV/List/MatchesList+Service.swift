//
//  MatchesList+Service.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 02/09/24.
//

import Foundation

struct MatchesResponse: Decodable {
    let beginAt: Date
    let league: League
    let id: UInt
    let opponents: [Opponent]
    let serie: Serie
    let status: Status

    struct League: Decodable {
        let imageUrl: URL?
        let name: String
    }

    struct Opponent: Decodable {
        let opponent: BaseTeam
    }

    struct BaseTeam: Decodable {
        let id: UInt
        let imageUrl: URL?
        let name: String
    }

    struct Serie: Decodable {
        let fullName: String
    }

    enum Status: String, Decodable {
        case canceled
        case finished
        case notStarted = "not_started"
        case postponed
        case running
    }
}

protocol MatchesListServiceable {
    func getMatches() async throws -> [MatchesResponse]
}

extension MatchesList {
    struct Service: HTTPClient, MatchesListServiceable {
        func getMatches() async throws -> [MatchesResponse] {
            try await request(endpoint: PandaEndpoint.matches)
        }
    }

    struct MockService: JSONMockClient, MatchesListServiceable {
        func getMatches() async throws -> [MatchesResponse] {
            loadJSON(filename: "matches")
        }
    }
}
