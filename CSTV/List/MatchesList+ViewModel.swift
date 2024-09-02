//
//  MatchesList+ViewModel.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 28/08/24.
//

import Foundation

extension MatchesList {
    @MainActor
    final class ViewModel: ObservableObject {
        @Published private(set) var state: ViewState<[MatchRow.Model]>

        private let service: MatchesListServiceable

        init(state: ViewState<[MatchRow.Model]> = .loading, service: MatchesListServiceable = Service()) {
            self.state = state
            self.service = service
        }

        @Sendable
        func loadMatches() async {
            // Because of pull to refresh, .loading is only used from empty
            do {
                let matches = try await service.getMatches()
                let matchRows = matches.compactMap(MatchRow.Model.init)
                state = .loaded(matchRows)

            } catch {
                handle(error: error)
            }
        }

        private func handle(error: Error) {
            state = .error(error)
        }
    }
}

extension MatchesList.ViewModel {
    static var mock: Self {
        .init(
            state: .loaded(
                [
                    .liveMock,
                    .closeUpcomingMock,
                    .farUpcomingMock
                ]
            ),
            service: MatchesList.MockService()
        )
    }
}

extension MatchRow.Model {
    init?(from response: MatchesResponse) {
        // Makes sure the necessary team info is available
        guard response.opponents.count == 2,
              let leftTeam = response.opponents.first?.opponent,
              let rightTeam = response.opponents.last?.opponent else {
            return nil
        }

        let isRunning = response.status == .running
        let time: String

        if isRunning {
            time = String(localized: "match_time_now")

        } else {
            // Does not follow the design perfectly, but has better localization
            time = response.beginAt.formatted(
                .dateTime.day(.twoDigits).month(.twoDigits).hour(.twoDigits(amPM: .abbreviated)).minute(.twoDigits)
            )
        }

        self = .init(
            id: response.id,
            isLive: isRunning,
            timeText: time,
            matchTeams: .init(
                leftTeamLogo: leftTeam.imageUrl?.withPathToThumbVersion(),
                leftTeamName: leftTeam.name,
                rightTeamLogo: rightTeam.imageUrl?.withPathToThumbVersion(),
                rightTeamName: rightTeam.name
            ),
            leagueLogo: response.league.imageUrl?.withPathToThumbVersion(),
            description: "\(response.league.name) \(response.serie.fullName)"
        )
    }
}
