//
//  ViewController.swift
//  StoryBoardSwiftUI
//
//  Created by huangphineas on 2023/2/17.
//

import UIKit

class ViewController: UIViewController {
    var count:Int = 0
    
    let objCObject = ObjCBridgeCpp()

    @IBOutlet weak var label1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        refreshUIView()
    }
    
    func refreshUIView() {
        label1.text = "Hello \(count)"
    }

    @IBAction func actionButton1(_ sender: Any) {
        objCObject.sayHello()
        objCObject.sayWorld()
        count += 1
        refreshUIView()
    }

    @IBAction func actionInsertSwiftUIButton(_ sender: Any) {
        let swiftUIView = Sample03SwiftUIView()
        self.host(component: AnyView(swiftUIView), into: self.view)
    }
}

import SwiftUI
extension UIViewController {
    /// component: View created by SwiftUI
    /// targetView: The UIView that will host the component
    func host(component: AnyView, into targetView: UIView) {
        let controller = UIHostingController(rootView: component)
        self.addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        targetView.addSubview(controller.view)
        controller.didMove(toParent: self)

        NSLayoutConstraint.activate([
            controller.view.widthAnchor.constraint(equalTo: targetView.widthAnchor, multiplier: 1),
            controller.view.heightAnchor.constraint(equalTo: targetView.heightAnchor, multiplier: 1),
            controller.view.centerXAnchor.constraint(equalTo: targetView.centerXAnchor),
            controller.view.centerYAnchor.constraint(equalTo: targetView.centerYAnchor)
        ])
    }
}

