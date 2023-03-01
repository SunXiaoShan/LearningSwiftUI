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
        print("=== ObjC bridge ==== \(count)")
        objCObject.sayHello()
        objCObject.sayWorld()
        print(objCObject.fileName())

        print("=== extern c bridge ==== \(count)")
        helloCPP()
        worldCPP()
        if let content = hexdump() {
            print("\(String(cString: content))")
        }

        print("=== extern c(2) bridge ==== \(count)")
        let cppObject = UnsafeRawPointer(initializeCpp())
        if let content2 = hexdump2(cppObject) {
            print("\(String(cString: content2))")
        }

        let fileNamebuff:String = "fefe"
        let cString = fileNamebuff.cString(using:.utf8)
        if let ccString = UnsafeMutablePointer<CChar>(mutating: cString) {
            let cppObject2 = UnsafeRawPointer(initializeCpp2(ccString))
            if let content2 = hexdump2(cppObject2) {
                print("\(String(cString: content2))")
            }
        }
        
        globalCallback = {
            if let ptr = $0 {
                let str = String(cString: ptr)
                print(str)
            }
        }
        callback_web_disconnected()

        // demo boost
        let boostSample1:WorldBoostSignal = WorldBoostSignal()
        boostSample1.initialSetup()
        boostSample1.actionTriggerSignalEvent()
        boostSample1.actionTriggerSignalEvent2()

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

