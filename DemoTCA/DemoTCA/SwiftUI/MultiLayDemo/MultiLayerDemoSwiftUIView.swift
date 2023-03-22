//
//  MultiLayDemoSwiftUIView.swift
//  DemoTCA
//
//  Created by huangphineas on 2023/3/3.
//

//import ComposableArchitecture
//import SwiftUI
//
struct State1 {
    struct State1_1 {
        var foo:Int
    }
    
    var childState:State1_1 = .init(foo: 0)
    var bar: Int = 0
}

struct State2 {
    var baz:Int = 0
}

struct MultiLayerDemoState {
    var state1:State1 = .init()
    var state2:State2 = .init()
}
//
//enum MultiLayerDemoAction: Equatable {}
//
//struct MultiLayerDemoEnvironment {}
//
//extension MultiLayerDemoEnvironment {
//    static var live = Self()
//}
//
//let multiLayerDemoReducer = AnyReducer<
//    MultiLayerDemoState,
//    MultiLayerDemoAction,
//    MultiLayerDemoEnvironment
//> { state, action, environment in
//        .none
//}
//
//struct MultiLayerDemoView: View {
//    typealias ViewStoreType = ViewStore<MultiLayerDemoState, MultiLayerDemoAction>
//    let store = Store<MultiLayerDemoState, MultiLayerDemoAction>(
//        initialState: .init(state1: State1(childState: State1.State1_1(foo: 1), bar: 0), state2: State2(baz: 999)),
//      reducer: multiLayerDemoReducer,
//      environment:.live
//    )
//
//    var body: some View {
//        WithViewStore(store) { viewStore in
//            Button {
//                print("sss")
//            } label: {
//               Text("Button")
//            }
////            Text("Hello\(viewStore.scope(state:\.state1.bar))")
////            Text("World\(viewStore.scope(state:\.state2.baz))")
//
//        }
//    }
//}
//
//#if DEBUG
//struct MultiLayerDemoView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
////            MultiLayerDemoView(store: .init)
//        }
//    }
//}
//#endif


