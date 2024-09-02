//
//  MatchesList+Service.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 02/09/24.
//

import Foundation

struct UpcomingMatches: Decodable {
    // TODO: Finish
}

protocol MatchesListServiceable {
    func getUpcomingMatches() async throws -> UpcomingMatches
}

extension MatchesList {
    struct Service: HTTPClient, MatchesListServiceable {
        func getUpcomingMatches() async throws -> UpcomingMatches {
            try await request(endpoint: PandaEndpoint.upcomingMatches)
        }
    }

    // TODO: Improve
    struct MockService: MatchesListServiceable {
        func getUpcomingMatches() async throws -> UpcomingMatches {
            UpcomingMatches()
        }
    }
}
