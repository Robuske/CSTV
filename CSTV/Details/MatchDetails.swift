//
//  MatchDetails.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 02/09/24.
//

import SwiftUI

struct MatchDetails: View {
    @StateObject var viewModel: ViewModel

    var body: some View {
        ZStack {
            MainColors.background.color
                .ignoresSafeArea()

            VStack(spacing: 20) {
                MatchTeams(model: viewModel.matchTeams)

                Text(viewModel.time)
                    .font(.robotoBold, size: 12, relativeTo: .subheadline, color: .textPrimary)

                switch viewModel.state {
                case .loading:
                    ProgressView()
                        .task(viewModel.loadDetails)

                case let .loaded(players):
                    loadedView(players)

                case let .error(error):
                    // TODO: Improve error handling
                    Text(error.localizedDescription)
                        .font(.robotoRegular, size: 12, relativeTo: .caption, color: .textPrimary)
                }

                Spacer()
            }

        }
        .navigationTitle(viewModel.title)
    }

    private func loadedView(_ players: (left: [PlayerDetails.Model], right: [PlayerDetails.Model])) -> some View {
        HStack(spacing: 12) {
            VStack(spacing: 12) {
                ForEach(players.left) { model in
                    PlayerDetails(isLeading: true, model: model)
                }
            }

            VStack(spacing: 12) {
                ForEach(players.right) { model in
                    PlayerDetails(isLeading: false, model: model)
                }
            }
        }
    }
}

struct MatchDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MatchDetails(viewModel: .mock)
        }
    }
}
