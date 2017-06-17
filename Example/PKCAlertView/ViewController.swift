//
//  ViewController.swift
//  PKCAlertView
//
//  Created by pikachu987 on 06/16/2017.
//  Copyright (c) 2017 pikachu987. All rights reserved.
//

import UIKit
import PKCAlertView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
            let alertView = PKCAlertView("asdf", description: "wewfw", leftText: "dsfadsfadsf", centerText: "ewrw", rightText: "qweq")
            
            alertView.addSuperView(self.view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

