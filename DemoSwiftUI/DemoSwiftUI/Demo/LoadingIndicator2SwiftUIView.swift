//
//  LoadingIndicator2SwiftUIView.swift
//  DemoSwiftUI
//
//  Created by huangphineas on 2023/2/13.
//

import SwiftUI

struct LoadingIndicator2SwiftUIView: View {
    @State var appeared = false
    let animation = Animation
        .linear(duration: 2)
        .repeatForever(autoreverses: false)
    var body: some View {
        Circle()
            .fill(Color.accentColor)
            .frame(width: 5, height: 5)
            .offset(y: -20)
            .rotationEffect(appeared ? Angle.degrees(360) : .zero)
            .onAppear {
                withAnimation(self.animation) { self.appeared = true
                }
            }
    }
}

struct LoadingIndicator2SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator2SwiftUIView()
    }
}
