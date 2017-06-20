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
    
    
    @objc fileprivate func defaultAction(_ sender: UIButton){
        print("defaultAction \(sender.currentTitle!)")
    }
    
    @objc fileprivate func leftAction(_ sender: UIButton){
        print("leftAction \(sender.currentTitle!)")
    }
    
    @objc fileprivate func rightAction(_ sender: UIButton){
        print("rightAction \(sender.currentTitle!)")
    }
    
    @objc fileprivate func centerAction(_ sender: UIButton){
        print("centerAction \(sender.currentTitle!)")
    }

}

extension ViewController: UITableViewDelegate{
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        
        
        let alertView = PKCAlertView(self.titleTextField.text!, message: self.messageTextField.text!)
        
        self.view.pkc_addSubview(alertView)
        alertView.animationTime = TimeInterval(timeSlider.value)
        
        
        if indexPath.section == 0{
            
            
            if indexPath.row == 0{
                alertView.addAlertView("OK") { (type, text) in
                    print("\(type),\(text)")
                }
            }
            
            
            else if indexPath.row == 1{
                alertView.addAlertView("Cancel", rightText: "OK") { (type, text) in
                    print("\(type),\(text)")
                }
            }
            
            
            else if indexPath.row == 2{
                alertView.addAlertView("Cancel", centerText: "Later", rightText: "OK") { (type, text) in
                    print("\(type),\(text)")
                }
            }
            
            
            
            else if indexPath.row == 3{
                alertView.addAlertView("Left", leftColor: UIColor.brown, rightText: "Right", rightColor: UIColor.darkText, handler: { (type, text) in
                    print("\(type),\(text)")
                })
                alertView.addAlertView("Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.") { (type, text) in
                    print("\(type),\(text)")
                }
                alertView.addAlertView("Default", textColor: UIColor.green) { (type, text) in
                    print("\(type),\(text)")
                }
                alertView.addAlertView("Left", leftColor: UIColor.red, centerText: "Center", centerColor: UIColor.gray, rightText: "Right", rightColor: UIColor.blue, handler: { (type, text) in
                    print("\(type),\(text)")
                })
                alertView.addAlertView("Default", textColor: .black) { (type, text) in
                    print("\(type),\(text)")
                }
            }
            
            
            
            else if indexPath.row == 4{
                let pkcAlertButton = PKCAlertButton("CustomButton")
                pkcAlertButton.addTarget(self, action: #selector(self.defaultAction(_:)), for: .touchUpInside)
                pkcAlertButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
                pkcAlertButton.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
                pkcAlertButton.highlightColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1)
                
                
                alertView.addAlertButton(pkcAlertButton, handler: { (type, text) in
                    print("\(type),\(text)")
                })
                
                
                
                
                
                
                
                let pkcAlertButton1 = PKCAlertButton("CustomLeftButton")
                pkcAlertButton1.addTarget(self, action: #selector(self.leftAction(_:)), for: .touchUpInside)
                pkcAlertButton1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 11)
                pkcAlertButton1.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
                pkcAlertButton1.highlightColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
                
                let pkcAlertButton2 = PKCAlertButton("CustomRightButton")
                pkcAlertButton2.addTarget(self, action: #selector(self.rightAction(_:)), for: .touchUpInside)
                pkcAlertButton2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 11)
                pkcAlertButton2.backgroundColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
                pkcAlertButton2.highlightColor = UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)
                
                
                alertView.addAlertButton(pkcAlertButton1, rightButton: pkcAlertButton2, handler: { (type, text) in
                    print("\(type),\(text)")
                })
                
                
                
                
                let pkcAlertButton3 = PKCAlertButton("CustomLeftButton")
                pkcAlertButton3.addTarget(self, action: #selector(self.leftAction(_:)), for: .touchUpInside)
                pkcAlertButton3.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
                pkcAlertButton3.backgroundColor = UIColor.brown
                pkcAlertButton3.highlightColor = UIColor.darkText
                
                let pkcAlertButton4 = PKCAlertButton("CustomCenterButton")
                pkcAlertButton4.addTarget(self, action: #selector(self.centerAction(_:)), for: .touchUpInside)
                pkcAlertButton4.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
                pkcAlertButton4.backgroundColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
                pkcAlertButton4.highlightColor = UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)
                
                let pkcAlertButton5 = PKCAlertButton("CustomRightButton")
                pkcAlertButton5.addTarget(self, action: #selector(self.rightAction(_:)), for: .touchUpInside)
                pkcAlertButton5.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
                pkcAlertButton5.backgroundColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
                pkcAlertButton5.highlightColor = UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)
                
                
                alertView.addAlertButton(pkcAlertButton3, centerButton: pkcAlertButton4, rightButton: pkcAlertButton5, handler: { (type, text) in
                    print("\(type),\(text)")
                })
                
                
                
            }
        }
        
        
        
        
        else{
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
        return section == 0 ? 5 : 3
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
            }else if indexPath.row == 4{
                cell.textLabel?.text = "Alert_Custom"
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
