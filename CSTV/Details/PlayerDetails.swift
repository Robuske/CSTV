//
//  PlayerDetails.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 02/09/24.
//

import SwiftUI

struct PlayerDetails: View {
    let isLeading: Bool
    let model: Model

    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            if isLeading {
                Spacer(minLength: 0)

            } else {
                buildPlaceholder(isLeading: false)
            }

            VStack(alignment: isLeading ? .trailing : .leading) {
                Text(model.nickname)
                    .font(.robotoBold, size: 14, relativeTo: .body, color: .textPrimary)

                Text(model.fullName)
                    .font(.robotoRegular, size: 12, relativeTo: .body, color: .textSecondary)
            }

            if isLeading {
                buildPlaceholder(isLeading: true)

            } else {
                Spacer(minLength: 0)
            }
        }
        .alignmentGuide(.bottom, computeValue: { dimensions in
            dimensions[.bottom] + 8
        })
        .padding(.horizontal, 8)
        .padding(.vertical, 2)
        .background(alignment: .bottom) {
            MainColors.elevated.color
                .clipShape(
                    CustomRoundedShape(radius: 12, corners: isLeading ? [.topRight, .bottomRight] : [.topLeft, .bottomLeft])
                )
        }
    }

    private func buildPlaceholder(isLeading: Bool) -> some View {
        PlaceholderImage(
            url: model.image,
            placeholderShape: RoundedRectangle(cornerRadius: 8)
        )
        .frame(width: 48, height: 48)
        .padding(.trailing, isLeading ? 4 : 16)
        .padding(.leading, isLeading ? 16 : 4)
    }
}

struct PlayerDetails_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            MainColors.background.color
                .ignoresSafeArea()

            HStack(spacing: 12) {
                PlayerDetails(isLeading: true, model: .mockOne)
                PlayerDetails(isLeading: false, model: .mockTwo)
            }
        }
    }
}
