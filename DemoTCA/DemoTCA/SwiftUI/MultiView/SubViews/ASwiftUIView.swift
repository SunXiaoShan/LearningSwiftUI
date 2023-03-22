//
//  ASwiftUIView.swift
//  DemoTCA
//
//  Created by huangphineas on 2023/2/24.
//

import ComposableArchitecture
import SwiftUI

struct AState: Equatable {
    var count:Int = 0
}

enum AAction: Equatable {
    case act1
    case act2
    case act3
}

struct AEnvironment {}

extension AEnvironment {
    static var live = Self()
}

let _AReducer = AnyReducer<
    AState,
    AAction,
    AEnvironment
> { state, action, environment in
    switch action {
    case .act1:
        state.count += 1
        return .none
    case .act2:
        state.count -= 1
        return .none
    case .act3:
        state.count = 0
        return .none
    }
}

struct AView: View {
    typealias ViewStoreType = ViewStore<AState, AAction>
    let store: Store<AState, AAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            Button {
                print("click A act1")
                viewStore.send(.act1)
            } label: {
                Text("A View - act1")
            }
            Button {
                print("click A act2")
                viewStore.send(.act2)
            } label: {
                Text("A View - act2")
            }
            Button {
                print("click A act3")
                viewStore.send(.act3)
            } label: {
                Text("A View - act3")
            }
            Text("A Value:\(viewStore.state.count)")
        }
    }
}

#if DEBUG
struct AView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AView(store: .init(
                initialState: .init(),
                reducer: _AReducer,
                environment: .live
            ))
        }
    }
}
#endif

