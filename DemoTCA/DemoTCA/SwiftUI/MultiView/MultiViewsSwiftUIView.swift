//
//  MultiViewsSwiftUIView.swift
//  DemoTCA
//
//  Created by huangphineas on 2023/2/24.
//

import ComposableArchitecture
import SwiftUI

struct RootState: Equatable {
    var stateA: AState
    var stateB: BState
}

enum RootAction: Equatable {
    case actionA(AAction)
    case actionB(BAction)
}

struct RootEnvironment {}

extension RootEnvironment {
    static var live = Self()
}

let rootReducer = AnyReducer<
    RootState,
    RootAction,
    RootEnvironment
> { state, action, environment in
    switch (action) {
    case .actionA(.act1):
        state.stateA.count += 1
        return .none

    case .actionA(.act2):
        state.stateA.count -= 1
        return .none

    case .actionA(.act3):
        state.stateA.count = 0
        return .none

    case .actionB(.act1):
        state.stateB.count += 1
        return .none

    case .actionB(.act2):
        state.stateB.count -= 1
        return .none

    case .actionB(.act3):
        state.stateB.count = 0
        return .none

    }
}

struct RootView: View {
    typealias ViewStoreType = ViewStore<RootState, RootAction>
    let store: Store<RootState, RootAction>
    let state = RootState(stateA: AState(), stateB: BState())

    var body: some View {
        WithViewStore(store) { viewStore in
            AView(store: store.scope(state: \.stateA, action: RootAction.actionA ))
            BView(store: store.scope(state: \.stateB, action: RootAction.actionB))
        }
    }
}

#if DEBUG
struct RootView_Previews: PreviewProvider {
    static let state = RootState(stateA: AState(), stateB: BState())
    static var previews: some View {
        NavigationView {
            RootView(store: .init(
                initialState: state,
                reducer: rootReducer,
                environment: .live
            ))
        }
    }
}
#endif

