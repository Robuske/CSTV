//
//  MainColors.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 28/08/24.
//

import SwiftUI

public enum MainColors: String, CaseIterable {
    case background
    case elevated
    case liveAccent
    case placeholder
    case separator
    case textPrimary
    case textSecondary
    case timeAccent

    private var folder: String {
        "MainColors/"
    }

    public var name: String {
        folder + rawValue
    }

    public var color: Color {
        Color(name)
    }

    public var uiColor: UIColor? {
        UIColor(named: name)
    }
}

public extension View {
    func background(_ color: MainColors, ignoresSafeAreaEdges: Edge.Set = .all) -> some View {
        background(color.color, ignoresSafeAreaEdges: ignoresSafeAreaEdges)
    }
}

public extension Text {
    func foregroundColor(_ color: MainColors) -> Text {
        foregroundColor(color.color)
    }
}

public extension Shape {
    func fill(_ color: MainColors, style: FillStyle = FillStyle()) -> some View {
        fill(color.color, style: style)
    }
}
