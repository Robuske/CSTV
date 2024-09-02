//
//  MatchesListViewModelTests.swift
//  CSTVTests
//
//  Created by Rodrigo Cardoso Buske on 02/09/24.
//

@testable import CSTV
import XCTest

final class MatchesListViewModelTests: XCTestCase {

    @MainActor
    func testViewModelLoad() async {
        let sut = MatchesList.ViewModel(service: MatchesList.MockService())

        XCTAssertTrue(sut.state.isLoading)

        await sut.loadMatches()

        guard case let .loaded(matches) = sut.state else {
            XCTFail("Expected state to be loaded")
            return
        }

        XCTAssertFalse(matches.isEmpty)

        let first = matches[0]

        XCTAssertTrue(first.isLive)

        XCTAssertEqual(first.leagueLogo?.absoluteString, "https://cdn.pandascore.co/images/league/image/5232/thumb_799px-cct_2024_europe_allmode-png")
        XCTAssertEqual(first.matchTeams.leftTeamLogo?.absoluteString, "https://cdn.pandascore.co/images/team/image/127014/thumb_927px_sinners_esports_full_allmode.png")
        XCTAssertEqual(first.matchTeams.rightTeamLogo?.absoluteString, "https://cdn.pandascore.co/images/team/image/133565/thumb_190px_revenant_esports_in_lightmode.png")

        XCTAssertEqual(first.description, "CCT Europe Series #10 season 2 2024")
    }

    @MainActor
    func testViewModelError() async {
        let sut = MatchesList.ViewModel(service: ErrorMock())

        await sut.loadMatches()

        guard case let .error(error) = sut.state, let networkError = error as? NetworkError else {
            XCTFail("Expected state to be error")
            return
        }

        XCTAssertEqual(networkError, .invalidResponse)
    }

    private struct ErrorMock: JSONMockClient, MatchesListServiceable {
        func getMatches() async throws -> [MatchesResponse] {
            throw NetworkError.invalidResponse
        }
    }
}

