//
//  BSwiftUIView.swift
//  DemoTCA
//
//  Created by huangphineas on 2023/2/24.
//

import ComposableArchitecture
import SwiftUI

struct BState: Equatable {
    var count:Int = 0
}

enum BAction: Equatable {
    case act1
    case act2
    case act3
}

struct BEnvironment {}

extension BEnvironment {
    static var live = Self()
}

let _BReducer = AnyReducer<
    BState,
    BAction,
    BEnvironment
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

struct BView: View {
    typealias ViewStoreType = ViewStore<BState, BAction>
    let store: Store<BState, BAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            Button {
                print("click B act1")
                viewStore.send(.act1)
            } label: {
                Text("B View - act1")
            }
            Button {
                print("click B act2")
                viewStore.send(.act2)
            } label: {
                Text("B View - act2")
            }
            Button {
                print("click B act3")
                viewStore.send(.act3)
            } label: {
                Text("B View - act3")
            }
            Text("B Value:\(viewStore.state.count)")
        }
    }
}

#if DEBUG
struct BView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BView(store: .init(
                initialState: .init(),
                reducer: _BReducer,
                environment: .live
            ))
        }
    }
}
#endif

