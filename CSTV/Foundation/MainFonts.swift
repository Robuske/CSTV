//
//  MainFonts.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 01/09/24.
//

import SwiftUI

public enum MainFonts: CaseIterable {
    case robotoRegular // Weight 400
    case robotoMedium // Weight 500
    case robotoBold // Weight 700

    public var name: String {
        switch self {
        case .robotoRegular:
            return "Roboto-Regular"

        case .robotoMedium:
            return "Roboto-Medium"

        case .robotoBold:
            return "Roboto-Bold"
        }
    }

    public func font(size: CGFloat, relativeTo textStyle: Font.TextStyle) -> Font {
        Font.custom(name, size: size, relativeTo: textStyle)
    }
}

public extension Text {
    func font(_ mainFont: MainFonts, size: CGFloat, relativeTo textStyle: Font.TextStyle, color: MainColors) -> Text {
        font(
            mainFont
                .font(
                    size: size,
                    relativeTo: textStyle
                )
        )
        .foregroundColor(color)
    }
}
