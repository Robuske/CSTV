//
//  PandaEndpoint.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 02/09/24.
//

import Foundation

enum PandaEndpoint {
    case upcomingMatches
    case matchDetail(id: String)
}

extension PandaEndpoint: Endpoint {
    private var accessToken: String {
        ""
    }

    var scheme: String {
        "https"
    }

    var host: String {
        "api.pandascore.co"
    }

    var method: String {
        "GET"
    }

    var header: [String: String]? {
        [
            "Authorization": "Bearer \(accessToken)"
        ]
    }
    
    var path: String {
        switch self {
        case .upcomingMatches:
            return "/csgo/matches/upcoming"

        case let .matchDetail(id):
            return "/csgo/matches/\(id)"
        }
    }
}
