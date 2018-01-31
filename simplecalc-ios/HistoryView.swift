//
//  historyView.swift
//  simplecalc-ios
//
//  Created by Joyce Huang on 1/31/18.
//  Copyright © 2018 Joyce Huang. All rights reserved.
//

import UIKit

class HistoryView:UIViewController {
    var history:[String] = []
    
    @IBOutlet weak var scroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...history.count-1{
            let label = UILabel(frame: CGRect(x: 50, y: i * 25 + 50, width: 300, height: 40))
            label.text = history[i]
            scroll.addSubview(label)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let mainView = segue.destination as! ViewController
        mainView.history = history
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
