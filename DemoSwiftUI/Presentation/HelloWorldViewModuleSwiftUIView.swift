//
//  HelloWorldViewModuleSwiftUIView.swift
//  DemoSwiftUI
//
//  Created by huangphineas on 2023/2/16.
//

import SwiftUI

@MainActor class ViewModel: ObservableObject {
    @Published var content:String
    @Published var count:Int

    init(content: String = "Default", count: Int = 0) {
        self.content = content
        self.count = count
    }
}

struct HelloWorldViewModuleSwiftUIView: View {
    @StateObject var viewModel:ViewModel = ViewModel()
    var body: some View {
        VStack {
            Button {
                viewModel.count += 1
                viewModel.content = "Hello\(viewModel.count)"
            } label: {
                Text("Button:\(viewModel.count)")
            }
            Text("\(viewModel.content)")
        }
    }
}

struct HelloWorldViewModuleSwiftUIView_Previews: PreviewProvider {
    static let viewModule = ViewModel(content: "World", count: 999)
    static var previews: some View {
        HelloWorldSwiftUIView(viewModel: viewModule)
    }
}
