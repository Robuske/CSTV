//
//  MainImages.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 01/09/24.
//

import SwiftUI

public enum MainImages: String, CaseIterable {
    case fuzeLogo

    public var name: String {
        rawValue
    }
}

public extension Image {
    init(decorative image: MainImages, bundle: Bundle? = nil) {
        self.init(decorative: image.name, bundle: bundle)
    }
}
