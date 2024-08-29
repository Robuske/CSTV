//
//  MatchRow.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 28/08/24.
//

import SwiftUI

struct MatchRow: View {
    let model: Model

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(.elevated)
            Text(model.description)
                .foregroundColor(.textPrimary)
        }
        .padding(.vertical, 12)
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}

extension MatchRow {
    struct Model: Identifiable {
        let id: String

        let description: String

        static let liveMock = Self.init(id: "liveMock", description: "Live Mock")
        static let closeUpcomingMock = Self.init(id: "closeUpcomingMock", description: "Close Upcoming Mock")
        static let farUpcomingMock = Self.init(id: "farUpcomingMock", description: "Far Upcoming Mock")
    }
}

struct MatchCell_Previews: PreviewProvider {
    static var previews: some View {
        List {
            MatchRow(model: .liveMock)
            MatchRow(model: .closeUpcomingMock)
            MatchRow(model: .farUpcomingMock)
        }
        .background(.background)
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
    }
}
