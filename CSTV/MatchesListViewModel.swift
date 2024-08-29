//
//  MatchesListViewModel.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 28/08/24.
//

import Foundation

class MatchesListViewModel: ObservableObject {
    @Published var matches: [MatchRow.Model] = [.liveMock, .closeUpcomingMock, .farUpcomingMock]
}
