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
    var countString = ""
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
        countString.append("\(display.text!) \(operation!) ")
        numArr.append(Int(display.text!))
        newNumber = true
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
        newNumber = true
    }
    @IBAction func equalsTap(_ sender: AnyObject) {
        var total:Int! = 0
        secondNum = Int(display.text!)
        numArr.append(secondNum)
        
        if operation == "+"{
            total = firstNum! + secondNum!
        }else if operation == "-" {
            total = firstNum! - secondNum!
        }else if operation == "/" {
            total = firstNum! / secondNum!
        }else if operation == "*"{
            total = firstNum! * secondNum!
        }else if operation == "%"{
            let temp = firstNum! / secondNum!
            total = firstNum! - (secondNum! * temp)
        }else if operation == "count"{
            total = numArr.count
        }else if operation == "avg"{
            var sum = 0
            for n in numArr {
                sum = sum + n!
            }
            total = sum / numArr.count
        }else if operation == "fact"{
            var fact = 1
            for n in 1...secondNum{
                fact = fact * n
            }
            total = fact
        }
        display.text = "\(Int(total))"
        if operation == "count" || operation == "avg"{
            countString.append("\(secondNum!) = \(total!)")
            history.append(countString)
        }else if operation == "fact" {
            history.append("\(secondNum!) fact = \(total!)")
        }else{
            history.append("\(firstNum!) \(operation!) \(secondNum!) = \(total!)")
        }
        numArr.removeAll()
        newNumber = true
    }
}

