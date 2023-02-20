//
//  Sample01SwiftUIView.swift
//  StoryBoardSwiftUI
//
//  Created by huangphineas on 2023/2/17.
//

import SwiftUI

struct Sample01SwiftUIView: UIViewControllerRepresentable {
    @State var buttonClickCount = 0
    
    func makeUIViewController(context: Context) -> Sample02ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc:Sample02ViewController = storyboard.instantiateViewController(withIdentifier: "Sample02ViewController")as! Sample02ViewController
        vc.delegate = context.coordinator
        return vc
    }

    func updateUIViewController(_ uiViewController: Sample02ViewController, context: Context) {
        uiViewController.sampleLable01.text = "Button click count:\(buttonClickCount)"
    }

    typealias UIViewControllerType = Sample02ViewController
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, Sample02ViewControllerDelegate {
        var parent:Sample01SwiftUIView
        
        init(parent: Sample01SwiftUIView) {
            self.parent = parent
        }
        
        func actionSampleButton01() {
            print("action button 01")
            self.parent.buttonClickCount += 1

        }

        func actionSampleSwitch01(_ sender:UISwitch) {
            print("action switch change.\(sender.isOn)")
        }
    }
}

struct Sample01SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Sample01SwiftUIView()
    }
}
