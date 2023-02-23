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
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
