//
//  SampleUnitTestSwiftUIView.swift
//  DemoTCA
//
//  Created by huangphineas on 2023/3/2.
//

import ComposableArchitecture
import SwiftUI

struct SampleUnitTestState: Equatable {
    var count:Int = 0
}

enum SampleUnitTestAction: Equatable {
    case increase
    case decrease
}

struct SampleUnitTestEnvironment {}

extension SampleUnitTestEnvironment {
    static var live = Self()
}

let sampleUnitTestReducer = Reducer<
    SampleUnitTestState,
    SampleUnitTestAction,
    SampleUnitTestEnvironment
> { state, action, environment in
    switch action {
    case .increase:
        state.count += 1
        return .none

    case .decrease:
        state.count -= 1
        return .none
    }
}

struct SampleUnitTestView: View {
    typealias ViewStoreType = ViewStore<SampleUnitTestState, SampleUnitTestAction>
    let store: Store<SampleUnitTestState, SampleUnitTestAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
        }
    }
}

#if DEBUG
struct SampleUnitTestView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SampleUnitTestView(store: .init(
                initialState: .init(),
                reducer: sampleUnitTestReducer,
                environment: .live
            ))
        }
    }
}
#endif

