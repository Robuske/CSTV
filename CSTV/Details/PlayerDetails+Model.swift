//
//  PlayerDetails+Model.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 02/09/24.
//

import Foundation

extension PlayerDetails {
    struct Model: Identifiable {
        let id: UInt
        let nickname: String
        let fullName: String
        let image: URL?

        static let mockOne = Self
            .init(
                id: 100,
                nickname: "MockOne",
                fullName: "Mock One",
                image: nil
            )

        static let mockTwo = Self
            .init(
                id: 200,
                nickname: "MockTwo",
                fullName: "Mock Two",
                image: nil
            )

        static let mockThree = Self
            .init(
                id: 300,
                nickname: "MockThree",
                fullName: "Mock Three",
                image: nil
            )

        static let mockFour = Self
            .init(
                id: 400,
                nickname: "MockFour",
                fullName: "Mock Four",
                image: nil
            )
    }

}
