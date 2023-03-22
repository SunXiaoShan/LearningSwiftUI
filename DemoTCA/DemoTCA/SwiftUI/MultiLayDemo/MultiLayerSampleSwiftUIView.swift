//
//  MultiLayerSampleSwiftUIView.swift
//  DemoTCA
//
//  Created by huangphineas on 2023/3/10.
//

import ComposableArchitecture
import SwiftUI

struct MultiLayerState1: Equatable {
    struct MultiLayerState1_1: Equatable {
        var foo:Int
    }
    
    var childState:MultiLayerState1_1 = .init(foo: 0)
    var bar: Int = 0
}

struct MultiLayerState2: Equatable {
    var baz:Int = 0
}

struct MultiLayerSampleState: Equatable {
    var state1:MultiLayerState1 = .init()
    var state2:MultiLayerState2 = .init()
}

enum MultiLayerAction1 {
    case hello
    case world
}

enum MultiLayerSampleAction {
    case action1(MultiLayerAction1)
}

struct MultiLayerSampleEnvironment {}

extension MultiLayerSampleEnvironment {
    static var live = Self()
}

let multiLayerSampleReducer = Reducer<
    MultiLayerSampleState,
    MultiLayerSampleAction,
    MultiLayerSampleEnvironment
> { state, action, environment in
        .none
}

struct MultiLayerSampleView: View {
    typealias ViewStoreType = ViewStore<MultiLayerSampleState, MultiLayerSampleAction>
    let store: Store<MultiLayerSampleState, MultiLayerSampleAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            MultiLayerSampleViewRoot(store: store)
        }
    }
}

struct MultiLayerSampleViewRoot: View {
    typealias ViewStoreType = ViewStore<MultiLayerSampleState, MultiLayerSampleAction>
    let store: Store<MultiLayerSampleState, MultiLayerSampleAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            Button {
                print("sss")
            } label: {
               Text("MultiLayerSampleView")
            }

            MultiLayerSampleViewLayer01(store: store.scope(state: \.state1, action: MultiLayerSampleAction.action1))
        }
    }
}

struct MultiLayerSampleViewLayer01: View {
    typealias ViewStoreType = ViewStore<MultiLayerState1, MultiLayerAction1>
    let store: Store<MultiLayerState1, MultiLayerAction1>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            Button {
                print("sss")
            } label: {
               Text("MultiLayerSampleViewLayer01")
            }
        }
    }
}

#if DEBUG
struct MultiLayerSampleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MultiLayerSampleView(store: .init(
                initialState: .init(),
                reducer: multiLayerSampleReducer,
                environment: .live
            ))
        }
    }
}
#endif

