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
        VStack(spacing: 0) {
            timeSection()

            Spacer(minLength: 16)
            MatchTeams(model: model.matchTeams)
            Spacer(minLength: 16)

            Divider()
                .background(.separator)

            leagueSection()
                .padding(.horizontal, 8)
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.elevated)
        )
        .padding(.vertical, 12)
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }

    private func timeSection() -> some View {
        HStack {
            Spacer()
            Text(model.timeText)
                .font(.robotoBold, size: 8, relativeTo: .caption2, color: .textPrimary)
                .padding(8)
                .background(model.isLive ? .liveAccent : .timeAccent)
                .clipShape(CustomRoundedShape(radius: 16, corners: [.topRight, .bottomLeft]))
        }
    }

    private func leagueSection() -> some View {
        HStack(spacing: 0) {
            PlaceholderImage(
                url: model.leagueLogo,
                placeholderShape: Circle()
            )
            .frame(width: 16, height: 16)
            .padding(8)
            Text(model.description)
                .font(.robotoRegular, size: 8, relativeTo: .caption2, color: .textPrimary)
            Spacer(minLength: 8)
        }
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
