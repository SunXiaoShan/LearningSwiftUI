//
//  Test01SwiftUIView.swift
//  DemoTCA
//
//  Created by huangphineas on 2023/2/24.
//

import SwiftUI

class StoreTest: ObservableObject {
    @Published var state1:Int = 0
    @Published var state2:Int = 0
}

struct View1: View {
    @ObservedObject var store: StoreTest
    var body: some View {
        Text("Hello, World!:\(store.state1)")
    }
}

struct View2: View {
    @ObservedObject var store: StoreTest
    var body: some View {
        Text("Hello, World!:\(store.state2)")
    }
}

struct ViewView: View {
    @StateObject var store = StoreTest()
    var body: some View {
        View1(store: store)
        View2(store: store)
        
        Button {
            store.state1 += 1
        } label: {
            Text("State1")
        }
        Button {
            store.state2 += 1
        } label: {
            Text("State2")
        }
    }
}

class StoreTest00: ObservableObject {
    @Published var state1:Int = 0
}

struct ObservedView: View {
    @ObservedObject var people:StoreTest00 = StoreTest00()
    var body: some View {
        VStack{
            Text("people:\(people.state1)")
            Button {
                people.state1 += 1
            } label: {
                Text("update (@ObservedObject)")
            }
        }
    }
}

struct Test01SwiftUIView: View {
    @State var root = 0
    var body: some View {
        VStack {
            Text("Hello, World!\(root)")
            Button {
                root += 1
            } label: {
                Text("Root")
            }

            ViewView()
            ObservedView()
        }
    }
}

struct Test01SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Test01SwiftUIView()
    }
}
