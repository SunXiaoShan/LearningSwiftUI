//
//  ShakeSwiftUIView.swift
//  DemoSwiftUI
//
//  Created by huangphineas on 2023/2/13.
//

import SwiftUI

struct Shake: AnimatableModifier {
    var times: CGFloat = 0
    let amplitude: CGFloat = 10
    var animatableData: CGFloat {
        get { times }
        set { times = newValue } }

    func body(content: Content) -> some View {
        print("shake time:\(times)")
        return content.offset(x: sin(times * .pi * 2) * amplitude)
    }
}

struct ShakeSwiftUIView: View {
    @State private var tapsAnimation: Int = 0
    @State private var tapsGeometryEffect: Int = 0
    var body: some View {
        Button("Shake animation") {
            withAnimation(.linear(duration: 0.5)) { self.tapsAnimation += 1
                print("shake:\(self.tapsAnimation)")
            }
        }
        .shakeAni(times: tapsAnimation * 3)
        Button("Shake GeometryEffect") {
            withAnimation(.linear(duration: 0.5)) { self.tapsGeometryEffect += 1
                print("shake:\(self.tapsGeometryEffect)")
            }
        }
        .shakeGeo(times: tapsGeometryEffect * 3)
    }
}

extension View {
    func shakeAni(times: Int) -> some View {
        return modifier(Shake(times: CGFloat(times)))
    }
    func shakeGeo(times: Int) -> some View {
        return modifier(ShakeEffect(times: CGFloat(times)))
    }
}

struct ShakeEffect: GeometryEffect {
    var times: CGFloat = 0
    let amplitude: CGFloat = 10

    var animatableData: CGFloat {
        get { times }
        set { times = newValue }
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(
            CGAffineTransform(translationX: sin(times * .pi * 2) * amplitude,y:0 )
        )
    }
}

struct ShakeSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ShakeSwiftUIView()
    }
}
