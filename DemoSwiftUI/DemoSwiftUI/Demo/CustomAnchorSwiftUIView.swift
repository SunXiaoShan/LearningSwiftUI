//
//  CustomAnchorSwiftUIView.swift
//  DemoSwiftUI
//
//  Created by huangphineas on 2023/2/9.
//

import SwiftUI

struct BoundsKey: PreferenceKey {
    static var defaultValue: Anchor<CGRect>? = nil
    static func reduce(value: inout Anchor<CGRect>?, nextValue: () -> Anchor<CGRect>?) {
        value = value ?? nextValue()
    }
}

struct CustomAnchorSwiftUIView: View {
    let tabs: [Text] = [
        Text("World Clock"),
        Text("Alarm"),
        Text("Bedtime")
    ]
    @State var selectedTabIndex = 0
    var body: some View {
        HStack {
            ForEach(tabs.indices) { tabIndex in
                Button(action: {
                    self.selectedTabIndex = tabIndex

                }, label: {
                    self.tabs[tabIndex]
                })
                .anchorPreference(key: BoundsKey.self, value: .bounds, transform: { anchor in
                    self.selectedTabIndex == tabIndex ? anchor : nil })
                }
        }
        .overlayPreferenceValue(BoundsKey.self, { anchor in GeometryReader { proxy in
            Rectangle()
                .fill(Color.accentColor)
                .frame(width: proxy[anchor!].width, height: 2)
                .offset(x: proxy[anchor!].minX)
        } })
    }
}

struct CustomAnchorSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAnchorSwiftUIView()
    }
}
