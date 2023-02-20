//
//  UIFrameLayoutSwiftUIView.swift
//  DemoSwiftUI
//
//  Created by huangphineas on 2023/2/16.
//

import SwiftUI

struct UIFrameLayoutSwiftUIView: View {
    var body: some View {
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
    }
}

struct UIFrameLayoutSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        UIFrameLayoutSwiftUIView()
    }
}
