//
//  BSwiftUIView.swift
//  DemoTCA
//
//  Created by huangphineas on 2023/2/24.
//

import ComposableArchitecture
import SwiftUI

struct BState: Equatable {}

enum BAction: Equatable {}

struct BEnvironment {}

extension BEnvironment {
    static var live = Self()
}

let _BReducer = AnyReducer<
    BState,
    BAction,
    BEnvironment
> { state, action, environment in
        .none
}

struct BView: View {
    typealias ViewStoreType = ViewStore<BState, BAction>
    let store: Store<BState, BAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
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

