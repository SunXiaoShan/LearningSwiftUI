//
//  DemoCustomButtonSwiftUIView.swift
//  DemoSwiftUI
//
//  Created by huangphineas on 2023/2/9.
//

import SwiftUI

struct DemoCustomButtonSwiftUIView: ButtonStyle {
    var foreground = Color.white
    var background = Color.blue

    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        Circle()
        .fill(background.opacity(configuration.isPressed ? 0.8 : 1)) .overlay(Circle().strokeBorder(foreground).padding(3)) .overlay(configuration.label.foregroundColor(foreground)) .frame(width: 75, height: 75)
    }
}

struct DemoCustomButtonSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Button("Button", action: {})
        .buttonStyle(DemoCustomButtonSwiftUIView())
    }
}
