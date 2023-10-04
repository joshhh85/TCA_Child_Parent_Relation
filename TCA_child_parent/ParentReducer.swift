//
//  Parent.swift
//  TCA_child_parent
//
//

import ComposableArchitecture
import SwiftUI

struct ParentReducer: Reducer {
    struct State: Equatable {
        var child: ChildReducer.State? = .init(title: "ABC", options: ["a", "b", "c", "d"])
    }
    
    enum Action: Equatable {
        case childAction(ChildReducer.Action)
    }
    
    var body: some ReducerOf<Self> {
        Reduce{ state, action in
            switch action {
            case .childAction(_):
//                state.child?.selectedOptions.removeAll()
                return .none
            }
        }
        
        .ifLet(\.child, action: /Action.childAction) {
            ChildReducer()
        }
    }
}

