//
//  ViewController.swift
//  simplecalc-ios
//
//  Created by Joyce Huang on 1/29/18.
//  Copyright © 2018 Joyce Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var firstNum:Int? = 0
    var secondNum:Int? = 0
    var operation:String? = nil
    var numArr = [Int?]()
    var extraButton:String? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func extraButtons(_ sender: UIButton) {
        let extraLabel:String? = sender.currentTitle
        if extraLabel == "count"{
            display.text = "\(numArr.count)"
            numArr.removeAll()
        }
    }
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func numberTap(_ sender: AnyObject) {
        display.text = sender.currentTitle
        numArr.append(Int(display.text!))
    }
    @IBAction func operationTap(_ sender: UIButton) {
        operation = sender.titleLabel?.text
        firstNum = Int(display.text!)
    }
    @IBAction func equalsTap(_ sender: AnyObject) {
        var total:Int! = 0
        secondNum = Int(display.text!)
        if secondNum == 0{
            display.text = "err div by 0"
        }else if operation == "+"{
            total = firstNum! + secondNum!
        } else if operation == "-" {
            total = firstNum! - secondNum!
        }else if operation == "/" {
            total = firstNum! / secondNum!
        }else if operation == "*"{
            total = firstNum! * secondNum!
        }else if operation == "%"{
            total = firstNum! / secondNum!
        }
        
        display.text = "\(Int(total))"
        
        
    }
}

