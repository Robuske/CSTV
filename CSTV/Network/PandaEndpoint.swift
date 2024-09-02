//
//  PandaEndpoint.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 02/09/24.
//

import Foundation

enum PandaEndpoint {
    case matches
    case teamsDetails(leftID: UInt, rightID: UInt)
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
        case .matches:
            return "/csgo/matches"

        case .teamsDetails:
            return "/csgo/teams"
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .matches:
            return [
                .init(name: "filter[opponents_filled]", value: "true"), // Only shows matches with opponents information
                .init(name: "filter[status]", value: "not_started,running"), // Only shows matches that haven't started or are running
                .init(name: "sort", value: "-status,begin_at") // Sort in descending order based on status and ascending on begin_at
            ]

        case let .teamsDetails(leftID, rightID):
            return [
                .init(name: "filter[id]", value: "\(leftID),\(rightID)")
            ]
        }
    }
}

extension URL {
    /// Creates new `URL` prepending `"thumb_"` to `lastPathComponent`
    func withPathToThumb() -> URL {
        var url = deletingLastPathComponent()
        url.append(path: "thumb_\(lastPathComponent)")

        return url
    }
}
