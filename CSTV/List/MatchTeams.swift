//
//  MatchTeams.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 31/08/24.
//

import SwiftUI

struct MatchTeams: View {
    let model: Model

    var body: some View {
        HStack(spacing: 20) {
            VStack(spacing: 8) {
                PlaceholderImage(
                    url: model.leftTeamLogo,
                    placeholderShape: Circle()
                )
                .frame(width: 60, height: 60)

                Text(model.leftTeamName)
                    .foregroundColor(.textPrimary)
            }

            Text("generic_vs")
                .foregroundColor(.textSecondary)

            VStack(spacing: 8) {
                PlaceholderImage(
                    url: model.rightTeamLogo,
                    placeholderShape: Circle()
                )
                .frame(width: 60, height: 60)

                Text(model.rightTeamName)
                    .foregroundColor(.textPrimary)
            }
        }
    }
}

extension MatchTeams {
    struct Model {
        let leftTeamLogo: URL?
        let leftTeamName: String
        let rightTeamLogo: URL?
        let rightTeamName: String

        static let mock = Self
            .init(
                leftTeamLogo: nil,
                leftTeamName: "Left Team",
                rightTeamLogo: nil,
                rightTeamName: "Right Team"
            )
    }
}

struct MatchTeams_Previews: PreviewProvider {
    static var previews: some View {
        MatchTeams(model: .mock)
            .background(.background)
    }
}
