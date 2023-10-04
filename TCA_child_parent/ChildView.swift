//
//  ChildView.swift
//  TCA_child_parent
//
//

import SwiftUI
import ComposableArchitecture

struct ChildView: View {
    let store: StoreOf<ChildReducer>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }, content: { viewStore in
            VStack(alignment: .leading) {
                Menu(content: {
                    ForEach(viewStore.options, id: \.self) { option in
                        Button(action: {
                            viewStore.send(.toggleSelection(option))
                        }) {
                            HStack {
                                Text(option).foregroundColor(.blue)
                                Spacer()
                                Image(systemName: viewStore.selectedOptions.contains(option) ? "checkmark.circle.fill" : "circle")

                            }.foregroundColor(.blue)
                        }
                    }
                }, label: {
                    Button(
                        action: {},
                        label: {
                            HStack {
                                Text(viewStore.title)
                                    .font(.title3)
                                    .padding(5)
                                    .foregroundColor(.white)
                            }
                            .background(viewStore.selectedOptions.isEmpty ? .gray.opacity(0.8) : .blue.opacity(0.8))
                            .cornerRadius(5)
                        }
                    )
                })
            }
        }
        
        )
        
    }
}
