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
                let upcomingMatches = try await service.getUpcomingMatches()
                let matches = upcomingMatches.map(MatchRow.Model.init)
                state = .loaded(matches)

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
    init(from response: UpcomingMatches) {
        // TODO: Finish
        self = Self.closeUpcomingMock
    }
}
