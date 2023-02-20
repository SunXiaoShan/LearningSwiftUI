//
//  Sample03SwiftUIView.swift
//  StoryBoardSwiftUI
//
//  Created by huangphineas on 2023/2/17.
//

import SwiftUI

struct Sample03SwiftUIView: View {
    @State var show = false
    var body: some View {
        VStack {
            Button {
                show.toggle()
            } label: {
                Text("我是 SwiftUI Button")
            }
            .border(Color.red)
            
            if show {
                Sample01SwiftUIView()
                    .border(Color.green)
            }
        }
    }
}

struct Sample03SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Sample03SwiftUIView()
    }
}
