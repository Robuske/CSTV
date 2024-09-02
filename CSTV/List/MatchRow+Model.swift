//
//  MatchRow+Model.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 31/08/24.
//

import Foundation

extension MatchRow {
    struct Model: Identifiable {
        let id: UInt

        let isLive: Bool
        let timeText: String

        let matchTeams: MatchTeams.Model

        let leagueLogo: URL?
        let description: String

        static let liveMock = Self
            .init(
                id: 0,
                isLive: true,
                timeText: String(localized: "match_time_now"),
                matchTeams: .mock,
                leagueLogo: nil,
                description: "Live Mock"
            )

        static let closeUpcomingMock = Self
            .init(
                id: 1,
                isLive: false,
                timeText: "Close Time",
                matchTeams: .mock,
                leagueLogo: nil,
                description: "Close Upcoming Mock"
            )

        static let farUpcomingMock = Self
            .init(
                id: 2,
                isLive: false,
                timeText: "Far Time",
                matchTeams: .mock,
                leagueLogo: nil,
                description: "Far Upcoming Mock"
            )
    }
}
