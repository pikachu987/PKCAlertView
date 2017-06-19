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
    @IBOutlet fileprivate weak var titleTextField: UITextField!
    @IBOutlet fileprivate weak var messageTextField: UITextField!
    @IBOutlet fileprivate weak var timeSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.titleTextField.resignFirstResponder()
        self.messageTextField.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UITableViewDelegate{
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertView = PKCAlertView(self.titleTextField.text!, message: self.messageTextField.text!)
        alertView.setSuperView(self.view)
        alertView.animationTime = TimeInterval(timeSlider.value)
        if indexPath.section == 0{
            if indexPath.row == 0{
                alertView.addAlertView("OK") { (type, text) in
                    print("\(type),\(text)")
                }
            }else if indexPath.row == 1{
                alertView.addAlertView("Cancel", rightText: "OK") { (type, text) in
                    print("\(type),\(text)")
                }
            }else if indexPath.row == 2{
                alertView.addAlertView("Cancel", centerText: "Later", rightText: "OK") { (type, text) in
                    print("\(type),\(text)")
                }
            }else if indexPath.row == 3{
                alertView.addAlertView("Left", leftColor: UIColor.brown, rightText: "Right", rightColor: UIColor.darkText, handler: { (type, text) in
                    print("\(type),\(text)")
                })
                alertView.addAlertView("Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.") { (type, text) in
                    print("\(type),\(text)")
                }
                alertView.addAlertButton("Default", textColor: UIColor.green) { (type, text) in
                    print("\(type),\(text)")
                }
                alertView.addAlertView("Left", leftColor: UIColor.red, centerText: "Center", centerColor: UIColor.gray, rightText: "Right", rightColor: UIColor.blue, handler: { (type, text) in
                    print("\(type),\(text)")
                })
                alertView.addAlertView("Default", textColor: .black) { (type, text) in
                    print("\(type),\(text)")
                }
            }
        }else{
            alertView.addAlertView("Cancel", rightText: "OK") { (type, text) in
                print("\(type),\(text)")
            }
            if indexPath.row == 0{
                alertView.animationType = .default
            }else if indexPath.row == 1{
                alertView.animationType = .alpha
            }else if indexPath.row == 2{
                alertView.animationType = .modal
            }
        }
        alertView.show()
    }
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Alert" : "Animation"
    }
}

extension ViewController: UITableViewDataSource{
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 4 : 3
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        if indexPath.section == 0{
            if indexPath.row == 0{
                cell.textLabel?.text = "Alert_Default"
            }else if indexPath.row == 1{
                cell.textLabel?.text = "Alert_Left_Right"
            }else if indexPath.row == 2{
                cell.textLabel?.text = "Alert_Left_Center_Right"
            }else if indexPath.row == 3{
                cell.textLabel?.text = "Alert_Complex"
            }
        }else{
            if indexPath.row == 0{
                cell.textLabel?.text = "Animation_Default"
            }else if indexPath.row == 1{
                cell.textLabel?.text = "Animation_Alpha"
            }else if indexPath.row == 2{
                cell.textLabel?.text = "Animation_Modal"
            }
        }
        return cell
    }
}


extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
