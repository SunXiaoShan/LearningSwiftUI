//
//  CustomLayoutButtonSwiftUIView.swift
//  DemoSwiftUI
//
//  Created by huangphineas on 2023/2/9.
//

import SwiftUI

struct CustomLayoutButtonSwiftUIViewKey: PreferenceKey {
    static let defaultValue: CGFloat? = nil
    static func reduce(value: inout CGFloat?,
                nextValue: () -> CGFloat?) {
        value = value ?? nextValue()
    }
}

struct CustomLayoutButtonSwiftUIView: View {
    @State private var width: CGFloat? = nil
    var body: some View {
        Text("Hello, world")
            .foregroundColor(Color.white)
            .background(GeometryReader { proxy in
            Color.clear.preference(key: CustomLayoutButtonSwiftUIViewKey.self, value: proxy.size.width) })
        .onPreferenceChange(CustomLayoutButtonSwiftUIViewKey.self) {
            let rawWidth = self.width
            self.width = $0
            let newWidth = self.width

            print("onPreferenceChange. old:\(rawWidth) new:\(newWidth)")
        }
        .frame(width: width, height: width) .background(Circle().fill(Color.blue))
    }
}


struct CustomLayoutButtonSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CustomLayoutButtonSwiftUIView()
    }
}
