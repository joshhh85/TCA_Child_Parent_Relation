//
//  TCA_child_parentApp.swift
//  TCA_child_parent
//
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_child_parentApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ParentView(store: Store(initialState: ParentReducer.State()) {
                ParentReducer() })
        }
    }
}


