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
            VStack {
                HStack {
                    Spacer()
                    Text(model.timeText)
                        .foregroundColor(.textPrimary)
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(model.isLive ? .liveAccent : .timeAccent)
                        )
                }
                Spacer()
                HStack {
                    VStack {
                        AsyncImage(url: model.leftTeamLogo) { image in
                            image
                        } placeholder: {
                            Color(MainColors.placeholder.name)
                        }
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)
                        .padding(8)
                        Text(model.leftTeamName)
                            .foregroundColor(.textPrimary)
                    }
                    Text("generic_vs")
                        .foregroundColor(.textSecondary)
                    VStack {
                        AsyncImage(url: model.rightTeamLogo) { image in
                            image
                        } placeholder: {
                            Color(MainColors.placeholder.name)
                        }
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)
                        .padding(8)
                        Text(model.rightTeamName)
                            .foregroundColor(.textPrimary)
                    }
                }
                Divider()
                    .background(.separator)
                HStack {
                    AsyncImage(url: model.leagueLogo) { image in
                        image
                    } placeholder: {
                        Color(MainColors.placeholder.name)
                    }
                    .clipShape(Circle())
                    .frame(width: 16, height: 16)
                    .padding(8)
                    Text(model.description)
                        .foregroundColor(.textPrimary)
                    Spacer()
                }
            }
        }
        .padding(.vertical, 12)
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}

extension MatchRow {
    struct Model: Identifiable {
        let id: String

        let isLive: Bool
        let timeText: String

        let leftTeamLogo: URL?
        let leftTeamName: String
        let rightTeamLogo: URL?
        let rightTeamName: String

        let leagueLogo: URL?
        let description: String

        static let liveMock = Self
            .init(
                id: "liveMock",
                isLive: true,
                timeText: "match_time_now",
                leftTeamLogo: nil,
                leftTeamName: "Left Team",
                rightTeamLogo: nil,
                rightTeamName: "Right Team",
                leagueLogo: nil,
                description: "Live Mock"
            )

        static let closeUpcomingMock = Self
            .init(
                id: "closeUpcomingMock",
                isLive: false,
                timeText: "Close Time",
                leftTeamLogo: nil,
                leftTeamName: "Left Team",
                rightTeamLogo: nil,
                rightTeamName: "Right Team",
                leagueLogo: nil,
                description: "Close Upcoming Mock"
            )

        static let farUpcomingMock = Self
            .init(
                id: "farUpcomingMock",
                isLive: false,
                timeText: "Far Time",
                leftTeamLogo: nil,
                leftTeamName: "Left Team",
                rightTeamLogo: nil,
                rightTeamName: "Right Team",
                leagueLogo: nil,
                description: "Far Upcoming Mock"
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
