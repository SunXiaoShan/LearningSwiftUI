//
//  PreferencesEnvSwiftUIView.swift
//  DemoSwiftUI
//
//  Created by huangphineas on 2023/2/8.
//

import SwiftUI

struct PreferencesEnvContentKey: PreferenceKey {
    static var defaultValue: Int = 123
    static func reduce(value: inout Int, nextValue: () -> Int) {
        value = nextValue() }
}

struct PreferencesEnvSwiftUIView: View {
    //let content: Content
    @Binding var context:Int
    var body: some View {
        Text("Preference:\(context)")
    }
}

extension PreferencesEnvSwiftUIView {
    func updateContent(_ content: Int) -> some View {
        preference(key: PreferencesEnvContentKey.self, value: content)
    }
}

struct PreferencesEnvSwiftUIView_Previews: PreviewProvider {
    @State static var fake: Int = 999
    static var previews: some View {
        PreferencesEnvSwiftUIView(context: $fake)
    }
}
