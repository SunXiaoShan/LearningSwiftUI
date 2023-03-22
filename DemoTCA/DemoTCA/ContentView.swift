//
//  ContentView.swift
//  DemoTCA
//
//  Created by huangphineas on 2023/2/23.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    @State var state: HelloWorldState = HelloWorldState()
    
    let state2 = RootState(stateA: AState(), stateB: BState())
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            HelloWorldView(store: Store(
                initialState: state,
                reducer: helloWorldReducer,
                environment: .live))
            MultiLayerSampleView(store: Store(
                initialState: MultiLayerSampleState(),
                reducer: multiLayerSampleReducer,
                environment: .live))
            RootView(store: .init(
                initialState: state2,
                reducer: rootReducer,
                environment: .live
            ))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
