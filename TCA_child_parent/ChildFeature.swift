//
//  ChildReducer.swift
//  TCA_child_parent
//
//

import ComposableArchitecture
import SwiftUI

struct ChildReducer: Reducer {
    struct State: Equatable {
        var title: String
        var options: [String] = []
        var selectedOptions: Set<String> = []
    }
    
    enum Action: Equatable {
        case clearState
        case toggleSelection(String)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .toggleSelection(let option):
                if state.selectedOptions.contains(option) {
                    state.selectedOptions.remove(option)
                } else {
                    state.selectedOptions.insert(option)
                }
                return .none
            case .clearState:
                state.selectedOptions.removeAll()
                return .none
            }
        }
    }
}

