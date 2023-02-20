//
//  Hello2SwiftUIView.swift
//  DemoSwiftUI
//
//  Created by huangphineas on 2023/2/16.
//

import SwiftUI

struct Hello3SwiftUIView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        Text("eee")
    }
}

struct Hello2SwiftUIView: View {
    @State var count = 0
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button {
                count += 1
            } label: {
                Text("\(count)")
            }
        }
        Hello3SwiftUIView()
    }
}

struct Hello2SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Hello2SwiftUIView()
    }
}
