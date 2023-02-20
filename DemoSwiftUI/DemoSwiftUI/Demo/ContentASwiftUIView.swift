//
//  ContentASwiftUIView.swift
//  DemoSwiftUI
//
//  Created by huangphineas on 2023/2/8.
//

import SwiftUI

struct ContentASwiftUIView: View {
    @State var count:Int = 0
    @Binding var insert:Int
    var body: some View {
        Text("Hello, World! \(insert)")
        Button(action: { count += 1 } ) {
            Text("WaWaWa:\(count)")
        }

    }
}

struct ContentASwiftUIView_Previews: PreviewProvider {
    @State static var fakeInsert:Int = 0
    static var previews: some View {
        ContentASwiftUIView(insert:$fakeInsert)
    }
}
