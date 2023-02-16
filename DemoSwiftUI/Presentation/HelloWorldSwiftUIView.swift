//
//  HelloWorldSwiftUIView.swift
//  DemoSwiftUI
//
//  Created by huangphineas on 2023/2/15.
//

import SwiftUI



struct HelloWorldSwiftUIView: View {
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

struct HelloWorldSwiftUIView_Previews: PreviewProvider {
    static let viewModule = ViewModel(content: "World", count: 999)
    static var previews: some View {
        HelloWorldSwiftUIView(viewModel: viewModule)
    }
}
