//
//  ContentView.swift
//  TCA_child_parent
//
//

import SwiftUI
import ComposableArchitecture

struct ParentView: View {
    let store: StoreOf<ParentReducer>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }, content: { viewStore in
            VStack {
                ChildView(store: Store(initialState: ChildReducer.State(title: viewStore.state.child?.title ?? "", options: viewStore.state.child?.options ?? [])) {
                    ChildReducer()
                })
                Button("Clear") {
                    viewStore.send(.childAction(.clearState))
                }
            }
        })
    }
}
