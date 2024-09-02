//
//  MatchesList.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 28/08/24.
//

import SwiftUI

struct MatchesList: View {
    @StateObject var viewModel: ViewModel

    var body: some View {
        NavigationView {
            ZStack {
                MainColors.background.color
                    .ignoresSafeArea()

                switch viewModel.state {
                case .loading:
                    ProgressView()
                        .task(viewModel.loadMatches)

                case let .loaded(matches):
                    loadedView(matches)

                case let .error(error):
                    // TODO: Improve error handling
                    Text(error.localizedDescription)
                }
            }
            .navigationTitle("matches_list_title")
            .modifier(CustomizeNavigationBar())
        }
    }

    func loadedView(_ matches: [MatchRow.Model]) -> some View {
        List(matches) { match in
            MatchRow(model: match)
        }
        .refreshable(action: viewModel.loadMatches)

        .listStyle(.plain)
        .scrollContentBackground(.hidden)
    }
}

private struct CustomizeNavigationBar: ViewModifier {
    init() {
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = MainColors.background.uiColor
        appearance.shadowColor = nil

        appearance.largeTitleTextAttributes = [
            .font: UIFont(name: MainFonts.robotoMedium.name, size: 32) as Any,
            .foregroundColor: MainColors.textPrimary.uiColor as Any
        ]
        appearance.titleTextAttributes = [
            .font: UIFont(name: MainFonts.robotoMedium.name, size: 18) as Any,
            .foregroundColor: MainColors.textPrimary.uiColor as Any
        ]

        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
    }

    func body(content: Content) -> some View {
        content
            // Would be better to use `.toolbarColorScheme(.dark, for: .navigationBar)`, but any `.toolbar` modifier breaks the other customizations
            .preferredColorScheme(.dark)
    }
}

struct MatchesList_Previews: PreviewProvider {
    static var previews: some View {
        MatchesList(viewModel:  .mock)
    }
}
