//
//  ViewState.swift
//  CSTV
//
//  Created by Rodrigo Cardoso Buske on 02/09/24.
//

import Foundation

public enum ViewState<Value> {
    case loading
    case error(Error)
    case loaded(Value)
}
