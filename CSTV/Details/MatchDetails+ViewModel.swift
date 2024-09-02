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

        init(state: ViewState<(left: [PlayerDetails.Model], right: [PlayerDetails.Model])>, title: String, matchTeams: MatchTeams.Model, time: String) {
            self.state = state
            self.title = title
            self.matchTeams = matchTeams
            self.time = time
        }

        @Sendable
        func loadDetails() async {

        }
    }
}

extension MatchDetails.ViewModel {
    static var mock: Self {
        .init(
            state: .loaded(
                (
                    left: [.mockOne, .mockTwo],
                    right: [.mockThree, .mockFour]
                )
            ),
            title: "Match Title",
            matchTeams: .mock,
            time: "Time"
        )
    }
}
