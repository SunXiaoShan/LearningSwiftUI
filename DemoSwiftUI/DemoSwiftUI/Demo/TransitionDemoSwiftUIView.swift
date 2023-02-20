//
//  TransitionDemoSwiftUIView.swift
//  DemoSwiftUI
//
//  Created by huangphineas on 2023/2/13.
//

import SwiftUI

struct TransitionDemoSwiftUIView: View {
    @State var visible = true
    @State var selected = false
    @State var changeColor = false
    @State var selectedRotation = false
    @State var animationStyleSelected = false
    
    var body: some View {
        VStack {
            Button("Toggle") { self.visible.toggle()
            }
            .border(Color.blue)
            Button("Transition Frame") { self.selected.toggle()
            }
            .border(Color.orange)
            Button("Transition Color") { self.changeColor.toggle()
            }
            .border(Color.purple)
            Button("Transition Rotation") { self.selectedRotation.toggle()
            }
            .border(Color.yellow)
            Button("AnimationStyle:\(animationStyleSelected ? "default" : "linear")") { self.animationStyleSelected.toggle()
            }
            .border(Color.black)
            if visible {
                Rectangle()
                    .fill(changeColor ? Color.green : Color.blue)
                    .frame(width: selected ? 100 : 50, height: 50)
                    .transition(.slide)
                    .rotationEffect(Angle.degrees(selectedRotation ? 45 : 0))
                    .animation(animationStyleSelected ? .default :      .linear(duration: 5))
            }
        }
    }
}

struct TransitionDemoSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionDemoSwiftUIView()
    }
}
