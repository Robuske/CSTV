//
//  MatchesList.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 28/08/24.
//

import SwiftUI

struct MatchesList: View {
    @StateObject var viewModel: MatchesListViewModel

    var body: some View {
        NavigationView {
            List(viewModel.matches) { match in
                MatchRow(model: match)
            }
            .background(.background)
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .navigationTitle("matches_list_title")
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(MainColors.background.color, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

struct MatchesList_Previews: PreviewProvider {
    static var previews: some View {
        MatchesList(viewModel: .init())
    }
}
