//
//  MainAssetsTests.swift
//  CSTVTests
//
//  Created by Rodrigo Cardoso Buske on 28/08/24.
//

@testable import CSTV
import SwiftUI
import XCTest

// Ensures all necessary resources are present
final class MainAssetsTests: XCTestCase {
    func testColors() {
        for color in MainColors.allCases {
            XCTAssertNotNil(UIColor(named: color.name), "Could not find color named \(color.name)")
        }
    }

    func testImages() {
        for image in MainImages.allCases {
            XCTAssertNotNil(UIImage(named: image.name), "Could not find image named \(image.name)")
        }
    }

    func testFonts() {
        for font in MainFonts.allCases {
            XCTAssertNotNil(UIFont(name: font.name, size: 17))
        }
    }
}
