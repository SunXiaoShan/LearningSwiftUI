//
//  ASwiftUIView.swift
//  DemoTCA
//
//  Created by huangphineas on 2023/2/24.
//

import ComposableArchitecture
import SwiftUI

struct AState: Equatable {
    
}

enum AAction: Equatable {}

struct AEnvironment {}

extension AEnvironment {
    static var live = Self()
}

let _AReducer = AnyReducer<
    AState,
    AAction,
    AEnvironment
> { state, action, environment in
        .none
}

struct AView: View {
    typealias ViewStoreType = ViewStore<AState, AAction>
    let store: Store<AState, AAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
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

