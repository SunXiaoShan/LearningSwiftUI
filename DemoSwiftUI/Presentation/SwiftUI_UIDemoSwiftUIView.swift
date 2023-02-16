//
//  SwiftUI_UIDemoSwiftUIView.swift
//  DemoSwiftUI
//
//  Created by huangphineas on 2023/2/16.
//

import SwiftUI

struct SwiftUI_UIDemoSwiftUIView: View {
    var body: some View {
        List(0..<5) { item in
            Button {
                print("Click \(item)")
            } label: {
                HStack() {
                    Image(systemName: "photo")
                    VStack(alignment: .leading) {
                        Text("[\(item)] Simon Ng")
                        Text("Founder of AppCoda")
                            .font(.subheadline)
                            .foregroundColor(Color(hue: 0.682, saturation: 0.036, brightness: 0.655))
                    }
                }
                .foregroundColor(Color.black)
            }
        }
    }
}

struct SwiftUI_UIDemoSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUI_UIDemoSwiftUIView()
    }
}
