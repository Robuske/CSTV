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
                .foregroundColor(.textPrimary)
                .padding(8)
                .background(model.isLive ? .liveAccent : .timeAccent)
                .clipShape(TimeRibbon())
        }
    }

    private func leagueSection() -> some View {
        HStack {
            PlaceholderImage(
                url: model.leagueLogo,
                placeholderShape: Circle()
            )
            .frame(width: 16, height: 16)
            .padding(8)
            Text(model.description)
                .foregroundColor(.textPrimary)
            Spacer(minLength: 8)
        }
    }
}

private struct TimeRibbon: Shape {
    private let radius = 16
    private let corners: UIRectCorner = [.bottomLeft, .topRight]

    init() {}

    func path(in rect: CGRect) -> Path {
        Path(
            UIBezierPath(
                roundedRect: rect,
                byRoundingCorners: corners,
                cornerRadii: .init(width: radius, height: radius)
            )
            .cgPath
        )
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
