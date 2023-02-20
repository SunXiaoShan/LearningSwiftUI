//
//  EnvironmentObjectSwiftUIView.swift
//  DemoSwiftUI
//
//  Created by huangphineas on 2023/2/8.
//

import SwiftUI

class EnvObjSettings: ObservableObject {
    @Published var score = 0
}

struct EnvironmentObjectSwiftUIView: View {
    @EnvironmentObject var value:EnvObjSettings
    
    var body: some View {
        Text("env obj:\(value.score)")
    }
}

struct EnvironmentObjectSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectSwiftUIView()
    }
}
