//
//  MatchesList+ViewModel.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 28/08/24.
//

import Foundation

extension MatchesList {
    class ViewModel: ObservableObject {
        @Published var matches: [MatchRow.Model] = [.liveMock, .closeUpcomingMock, .farUpcomingMock]

        func refresh() {
            print(#function)
        }
    }
}
