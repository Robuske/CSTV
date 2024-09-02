//
//  CustomRoundedShape.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 02/09/24.
//

import SwiftUI

public struct CustomRoundedShape: Shape {
    private let radius: CGFloat
    private let corners: UIRectCorner

    public init(radius: CGFloat, corners: UIRectCorner) {
        self.radius = radius
        self.corners = corners
    }

    public func path(in rect: CGRect) -> Path {
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
