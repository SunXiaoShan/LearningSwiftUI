//
//  ContentView.swift
//  DemoSwiftUI
//
//  Created by huangphineas on 2023/2/8.
//

import SwiftUI

struct ContentView: View {
    @State var mainRootCount: Int = 0
    @StateObject var envObj: EnvObjSettings = EnvObjSettings()
    let longString = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button {
                mainRootCount += 1
                envObj.score += 1
                
            } label: {
                Text("Binding Button")
            }

            ContentASwiftUIView(insert: $mainRootCount)
            EnvironmentDemoSwiftUIView().demoEnviroment("222")
            EnvironmentObjectSwiftUIView().environmentObject(envObj)
            PreferencesEnvSwiftUIView(context: $mainRootCount).updateContent(mainRootCount).onPreferenceChange(PreferencesEnvContentKey.self) { value in
                print("xxx\(value)")
            }
            
            Circle()
            .fill(Color.blue)
            .overlay(
                Circle()
                    .strokeBorder(Color.white)
                    .padding(3))
            .overlay(
                Text("Start")
                    .foregroundColor(.white))
            .frame(width: 75, height: 75)
            
            CustomTransitionSwiftUIView()
            AnyTransitionDemoSwiftUIView()
                .border(Color.red)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
