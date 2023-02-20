//
//  AnyTransitionDemoSwiftUIView.swift
//  DemoSwiftUI
//
//  Created by huangphineas on 2023/2/14.
//

import SwiftUI

struct AnyTransitionDemoSwiftUIView: View {
    @State var showOpacity = false
    @State var transitionScale = false
    @State var slide = false
    @State var moveTransition = false
    @State var asymmetricTransition = false

    let animation = Animation.linear(duration: 5)

    var body: some View {
        VStack {
            Button {
                withAnimation(animation) {
                    showOpacity.toggle()
                }
            } label: {
                Text("showOpacity")
            }
            Button {
                withAnimation(animation) {
                    transitionScale.toggle()
                }
                
            } label: {
                Text("transitionScale")
            }
            Button {
                withAnimation(animation) {
                    slide.toggle()
                }
            } label: {
                Text("slide")
            }
            Button {
                withAnimation(animation) {
                    moveTransition.toggle()
                }
            } label: {
                Text("moveTransition")
            }
            Button {
                withAnimation(animation) {
                    asymmetricTransition.toggle()
                }
            } label: {
                Text("asymmetricTransition")
            }
        }
        
        Spacer()
        
        VStack {
            if showOpacity {
                // Opacity Transition
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 50, height: 50)
                    .transition(.opacity)
            }
            if transitionScale {
                // Scale Transition
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
                    .frame(width:  100, height: 50)
                    .transition(.scale(scale: 0.5, anchor: UnitPoint(x: 1, y: 0)))
            }
            if slide {
                // Slide Transition
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.red)
                    .frame(width:  100, height: 50)
                    .transition(.slide)
            }
            if moveTransition {
                // Move Transition
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.yellow)
                    .frame(width:  100, height: 50)
                    .transition(.move(edge: .leading))
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.purple)
                    .frame(width:  100, height: 50)
                    .transition(.move(edge: .trailing))
            }
            if asymmetricTransition {
                // Asymmetric Transition
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.brown)
                    .frame(width:  100, height: 50)
                    .transition(.asymmetric(insertion: .scale(scale: 0.2), removal: .move(edge: .trailing)))
            }
            
        }
        .padding()
    }
}

struct AnyTransitionDemoSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AnyTransitionDemoSwiftUIView()
    }
}
