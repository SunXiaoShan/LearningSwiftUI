//
//  EnvironmentSwiftUIView.swift
//  DemoSwiftUI
//
//  Created by huangphineas on 2023/2/16.
//

import SwiftUI

fileprivate struct ValueKey: EnvironmentKey {
    static let defaultValue: CGFloat = 0.1
}

extension EnvironmentValues {
    var envValue: CGFloat {
        get { self[ValueKey.self] }
        set { self[ValueKey.self] = newValue }
    }
}

fileprivate extension View {
    func envValue(_ size: CGFloat) -> some View {
        environment(\.envValue, size) }
}

struct KnobShape: Shape {
    var pointerSize: CGFloat = 0.1
    var pointerWidth: CGFloat = 0.1
    func path(in rect: CGRect) -> Path {
        let pointerHeight = rect.height * pointerSize
        let pointerWidth = rect.width * self.pointerWidth
        let circleRect = rect.insetBy(dx: pointerHeight, dy: pointerHeight)
        return Path { p in
            p.addEllipse(in: circleRect)
            p.addRect(CGRect(x: rect.midX - pointerWidth/2, y: 0, width: pointerWidth, height: pointerHeight + 2))
        }
    }
}

struct Knob: View {
    @Environment(\.envValue) var env
    var pointerSize: CGFloat? = 0.01

    var body: some View {
        KnobShape(pointerSize: pointerSize ?? env )
            .fill(Color.green)
            .onAppear() {
                print("debug pointerSize: \(pointerSize ?? -111)")
            }
    }
}

struct EnvironmentSwiftUIView: View {
    @State var volume: CGFloat = 0.2

    var body: some View {
        VStack {
            Knob(pointerSize: volume)
                .frame(width: 100, height: 100)
                .envValue(0.2)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct EnvironmentSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentSwiftUIView()
    }
}
