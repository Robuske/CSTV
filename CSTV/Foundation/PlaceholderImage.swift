//
//  PlaceholderImage.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 31/08/24.
//

import SwiftUI

struct PlaceholderImage<Placeholder: Shape>: View {
    let url: URL?
    let placeholderShape: Placeholder

    var body: some View {
        AsyncImage(url: url) { image in
            image

        } placeholder: {
            MainColors.placeholder.color
                .clipShape(placeholderShape)
        }
    }
}

struct PlaceholderImage_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PlaceholderImage(
                url: nil,
                placeholderShape: Circle()
            )
            .frame(width: 60, height: 60)

            PlaceholderImage(
                url: nil,
                placeholderShape: RoundedRectangle(cornerRadius: 16)
            )
            .frame(width: 60, height: 60)
        }
    }
}
