//
//  LoadingIndicatorSwiftUIView.swift
//  DemoSwiftUI
//
//  Created by huangphineas on 2023/2/10.
//

import SwiftUI

struct LoadingIndicatorSwiftUIView: View {
    @State private var animating = false
    private let duration:Double = 2
    var body: some View {
        Image(systemName: "rays")
            .rotationEffect(animating ? Angle.degrees(360) : .zero)
            .animation(Animation.linear(duration: duration)
                .repeatForever(autoreverses: false) )
        .onAppear { self.animating = true } }
}

struct LoadingIndicatorSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicatorSwiftUIView()
    }
}
