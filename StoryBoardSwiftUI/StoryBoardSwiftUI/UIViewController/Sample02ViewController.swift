//
//  Sample02ViewController.swift
//  StoryBoardSwiftUI
//
//  Created by huangphineas on 2023/2/17.
//

import UIKit

public protocol Sample02ViewControllerDelegate : NSObjectProtocol {
    func actionSampleButton01()
    func actionSampleSwitch01(_ sender:UISwitch)
}

class Sample02ViewController: UIViewController {

    @IBOutlet weak var sampleButton01: UIButton!
    
    @IBOutlet weak var sampleLable01: UILabel!
    @IBOutlet weak var sampleLabel02: UILabel!
    
    @IBOutlet weak var sampleSwitch01: UISwitch!
    
    public var delegate:Sample02ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionSampleButton(_ sender: Any) {
        delegate?.actionSampleButton01()
    }
    
    @IBAction func actionSampleSwitch01(_ sender: Any) {
        delegate?.actionSampleSwitch01(sender as! UISwitch)
    }
}
