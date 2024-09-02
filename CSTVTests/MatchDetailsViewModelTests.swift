//
//  MatchDetailsViewModelTests.swift
//  CSTVTests
//
//  Created by Rodrigo Cardoso Buske on 02/09/24.
//

@testable import CSTV
import XCTest

final class MatchDetailsViewModelTests: XCTestCase {

    @MainActor
    func testViewModelLoad() async {
        let sut = MatchDetails.ViewModel(title: "Title", matchTeams: .mock, time: "Time", service: MatchDetails.MockService())

        XCTAssertTrue(sut.state.isLoading)

        await sut.loadDetails()

        guard case let .loaded(players) = sut.state else {
            XCTFail("Expected state to be loaded")
            return
        }

        XCTAssertFalse(players.left.isEmpty)
        XCTAssertFalse(players.right.isEmpty)

        let first = players.left[0]

        XCTAssertEqual(first.image?.absoluteString, "https://cdn.pandascore.co/images/player/image/23238/thumb_900px_nafany_berlin_minor.png")

        XCTAssertEqual(first.fullName, "Vladislav Gorshkov")
    }

    @MainActor
    func testViewModelError() async {
        let sut = MatchDetails.ViewModel(title: "Title", matchTeams: .mock, time: "Time", service: ErrorMock())

        await sut.loadDetails()

        guard case let .error(error) = sut.state, let networkError = error as? NetworkError else {
            XCTFail("Expected state to be error")
            return
        }

        XCTAssertEqual(networkError, .invalidResponse)
    }

    private struct ErrorMock: JSONMockClient, MatchDetailsServiceable {
        func getTeamsDetails(leftID: UInt, rightID: UInt) async throws -> [MatchesDetailsResponse] {
            throw NetworkError.invalidResponse
        }
    }
}
