//
//  PKCButtonView.swift
//  Pods
//
//  Created by Kim Guanho on 2017. 6. 17..
//
//

import UIKit

class PKCButtonView: UIView {
    private var lastButtonGroupView: PKCButtonGrouopView?
    private var bottomConst: NSLayoutConstraint?
    
    public init() {
        super.init(frame: CGRect.zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        let buttonViewHeightConst = NSLayoutConstraint(
            item: self,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .height,
            multiplier: 1,
            constant: 44)
        buttonViewHeightConst.priority = UILayoutPriority.init(999)
        self.addConstraint(buttonViewHeightConst)
    }
    
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addButtonGroupView(_ text: String, textColor: UIColor, handler: ((PKCAlertButtonType, String) -> Void)? = nil) -> PKCButtonGrouopView{
        let buttonGroupView = PKCButtonGrouopView(text, textColor: textColor, handler: handler)
        self.addButtonGroupView(buttonGroupView)
        return buttonGroupView
    }
    
    func addButtonGroupView(_ leftText: String, leftColor: UIColor, rightText: String, rightColor: UIColor, handler: ((PKCAlertButtonType, String) -> Void)? = nil) -> PKCButtonGrouopView{
        let buttonGroupView = PKCButtonGrouopView(leftText, leftColor: leftColor, rightText: rightText, rightColor: rightColor, handler: handler)
        self.addButtonGroupView(buttonGroupView)
        return buttonGroupView
    }
    
    func addButtonGroupView(_ leftText: String, leftColor: UIColor, centerText: String, centerColor: UIColor, rightText: String, rightColor: UIColor, handler: ((PKCAlertButtonType, String) -> Void)? = nil) -> PKCButtonGrouopView{
        let buttonGroupView = PKCButtonGrouopView(leftText, leftColor: leftColor, centerText: centerText, centerColor: centerColor, rightText: rightText, rightColor: rightColor, handler: handler)
        self.addButtonGroupView(buttonGroupView)
        return buttonGroupView
    }
    
    
    
    
    
    
    
    
    private func addButtonGroupView(_ buttonGroupView: PKCButtonGrouopView){
        self.addSubview(buttonGroupView)
        self.addConstraints(buttonGroupView.horizontalLayout())
        if self.bottomConst == nil && self.lastButtonGroupView == nil{
            let topConst = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: buttonGroupView, attribute: .top, multiplier: 1, constant: 0)
            self.addConstraint(topConst)
        }else{
            let topConst = NSLayoutConstraint(item: self.lastButtonGroupView!, attribute: .bottom, relatedBy: .equal, toItem: buttonGroupView, attribute: .top, multiplier: 1, constant: 0)
            self.addConstraint(topConst)
        }
        self.bottomConst?.isActive = false
        let bottomConst = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: buttonGroupView, attribute: .bottom, multiplier: 1, constant: 0)
        self.addConstraint(bottomConst)
        
        self.bottomConst = bottomConst
        self.lastButtonGroupView = buttonGroupView
        
    }
    
}
