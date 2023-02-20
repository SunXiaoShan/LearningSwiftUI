//
//  CustomTransitionSwiftUIView.swift
//  DemoSwiftUI
//
//  Created by huangphineas on 2023/2/13.
//

import SwiftUI

struct Blur: ViewModifier {
    var active: Bool

    func body(content: Content) -> some View {
        return content
            .blur(radius: active ? 50 : 0)
            .opacity(active ? 0 : 1)
    }
}

extension AnyTransition {
    static var blur: AnyTransition {
        .modifier(active: Blur(active: true), identity: Blur(active: false))
    }
}

struct CustomTransitionSwiftUIView: View {
    @State var active = false
    let animation = Animation.linear(duration: 5)

    var body: some View {
        Button {
            withAnimation(animation) {
                self.active.toggle()
                print("Click \(active)")
            }
            
        } label: {
            Text("AnyTransition")
        }
        .border(Color.brown)

        if active {
            Rectangle()
                .fill(Color.green)
                .frame(width: 50, height: 50)
                .transition(.blur)
                .onAppear {
                    withAnimation(self.animation) {
                    }
                }
        }
    }
}



struct CustomTransitionSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTransitionSwiftUIView()
    }
}
