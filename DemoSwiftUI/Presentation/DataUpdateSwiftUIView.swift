//
//  DataUpdateSwiftUIView.swift
//  DemoSwiftUI
//
//  Created by huangphineas on 2023/2/16.
//

import SwiftUI

struct DataUpdateSwiftUIView: View {
    @State var value:Double = 0.0
    var body: some View {
        VStack {
            DataUpdateSubviewSwiftUIView(value: $value)
            Slider(value: $value, in: (0...1))
        }
    }
}

struct DataUpdateSubviewSwiftUIView: View {
    @Binding var value:Double
    var body: some View {
        Text("Progress:\(value)")
    }
}

struct DataUpdateSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DataUpdateSwiftUIView()
    }
}
