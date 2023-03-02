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

struct RootAction: Equatable {
    var actionA: AAction
    var actionB: BAction
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
        .none
}

struct RootView: View {
    typealias ViewStoreType = ViewStore<RootState, RootAction>
    let store: Store<RootState, RootAction>
    let state = RootState(stateA: AState(), stateB: BState())
    
    var body: some View {
        WithViewStore(store) { viewStore in
//            AView(store: store.scope(state: state.stateA))
//            BView(store: store.scope(state: state.stateB))
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

