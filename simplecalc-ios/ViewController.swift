//
//  ViewController.swift
//  simplecalc-ios
//
//  Created by Joyce Huang on 1/29/18.
//  Copyright © 2018 Joyce Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var history:[String] = []
    var firstNum:Int! = 0
    var secondNum:Int! = 0
    var operation:String! = nil
    var numArr = [Int?]()
    var newNumber = false
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        display.text = ""
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let historyView = segue.destination as! HistoryView
        historyView.history = history
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func extraButtons(_ sender: UIButton) {
        operation = sender.titleLabel?.text
    }
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func numberTap(_ sender: UIButton) {
        if newNumber == true {
            display.text = ""
        }
        newNumber = false
        display.text!.append(sender.currentTitle!)
    }
    @IBAction func operationTap(_ sender: UIButton) {
        operation = sender.titleLabel?.text
        firstNum = Int(display.text!)
        numArr.append(Int(display.text!))
        newNumber = true
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
        }else if operation == "count"{
            total = numArr.count
        }
        display.text = "\(Int(total))"
        
        history.append("\(firstNum!) \(operation!) \(secondNum!) = \(Int(total))")
        
        newNumber = true
    }
}

