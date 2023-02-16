//
//  SlideDemoSwiftUIView.swift
//  DemoSwiftUI
//
//  Created by huangphineas on 2023/2/16.
//

import SwiftUI

struct SlideDemoSwiftUIView: View {
    let animation = Animation.linear(duration: 5)
    @State var visible = false
    var body: some View {
        VStack {
            Button {
                withAnimation(animation) {
                    visible.toggle()
                }
            } label: {
                Text("Button")
            }
            
            if visible {
                Rectangle()
                    .fill(Color.green)
                    .frame(width:100, height: 50)
                    .transition(.slide)
            }
        }
    }
}

struct SlideDemoSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SlideDemoSwiftUIView()
    }
}
