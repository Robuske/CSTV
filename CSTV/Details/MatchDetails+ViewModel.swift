//
//  MatchDetails+ViewModel.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 02/09/24.
//

import Foundation

extension MatchDetails {
    @MainActor
    final class ViewModel: ObservableObject {
        @Published private(set) var state: ViewState<(left: [PlayerDetails.Model], right: [PlayerDetails.Model])>
        let title: String
        let matchTeams: MatchTeams.Model
        let time: String

        private let service: MatchDetailsServiceable

        init(state: ViewState<(left: [PlayerDetails.Model], right: [PlayerDetails.Model])> = .loading, title: String, matchTeams: MatchTeams.Model, time: String, service: MatchDetailsServiceable = Service()) {
            self.state = state
            self.title = title
            self.matchTeams = matchTeams
            self.time = time
            self.service = service
        }

        @Sendable
        func loadDetails() async {
            do {
                let teams = try await service.getTeamsDetails(leftID: matchTeams.leftTeamID, rightID: matchTeams.rightTeamID)
                handle(teams: teams)

            } catch {
                handle(error: error)
            }
        }

        private func handle(teams: [MatchesDetailsResponse]) {
            // There should only be two elements, so performance is not a problem
            guard let leftTeam = teams.first(where: { $0.id == matchTeams.leftTeamID }),
                  let rightTeam = teams.first(where: { $0.id == matchTeams.rightTeamID }) else {
                state = .error(NetworkError.invalidResponse)
                return
            }

            let leftPlayers = leftTeam.players.map(PlayerDetails.Model.init)
            let rightPlayers = rightTeam.players.map(PlayerDetails.Model.init)
            state = .loaded((leftPlayers, rightPlayers))
        }

        private func handle(error: Error) {
            state = .error(error)
        }
    }
}

extension MatchDetails.ViewModel {
    static var mock: Self {
        .init(
            title: "Match Title",
            matchTeams: .mock,
            time: "Time",
            service: MatchDetails.MockService()
        )
    }
}

extension PlayerDetails.Model {
    init(from response: MatchesDetailsResponse.Player) {
        let firstName = response.firstName ?? ""
        let lastName = response.lastName ?? ""

        self = .init(
            id: response.id,
            nickname: response.name,
            fullName: "\(firstName) \(lastName)",
            image: response.imageUrl?.withPathToThumb()
        )
    }
}
