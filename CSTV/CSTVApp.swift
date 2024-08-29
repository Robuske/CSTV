//
//  CSTVApp.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 27/08/24.
//

import SwiftUI

@main
struct CSTVApp: App {
    @State var initialized = false
    var body: some Scene {
        WindowGroup {
            if initialized {
                MatchesList(viewModel: .init())
                
            } else {
                SplashView()
                    .onAppear {
                        initialized = true
                    }
            }
        }
    }
}
