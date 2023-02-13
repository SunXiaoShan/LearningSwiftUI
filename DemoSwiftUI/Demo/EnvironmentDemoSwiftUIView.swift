//
//  EnvironmentDemoSwiftUIView.swift
//  DemoSwiftUI
//
//  Created by huangphineas on 2023/2/8.
//

import SwiftUI

struct EnvironmentDemoSwiftUIView: View {
    @Environment(\.demoEnv) var envDemoEnv
    var body: some View {
        VStack {
            Text(envDemoEnv)
        }
    }
}

fileprivate struct DemoEnvironmentKey: EnvironmentKey {
    static let defaultValue: String = "000000"
}

extension View {
    func demoEnviroment(_ newString: String) -> some View {
        environment(\.demoEnv, newString)
    }
}

extension EnvironmentValues {
    var demoEnv: String {
        get { self[DemoEnvironmentKey.self] }
        set { self[DemoEnvironmentKey.self] = newValue }
    }
}

struct EnvironmentDemoSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentDemoSwiftUIView()
    }
}

