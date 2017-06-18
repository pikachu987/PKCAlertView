//
//  PKCButtonGroupView.swift
//  Pods
//
//  Created by Kim Guanho on 2017. 6. 17..
//
//

import UIKit

protocol PKCButtonDelegate: class {
    func pkcButtonAction()
}

class PKCButtonGrouopView: UIView {
    var lineView: PKCLineView!
    var delegate: PKCButtonDelegate?
    var handler: ((PKCAlertButtonType, String) -> Void)? = nil
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
    }
    
    private func addLineView(){
        self.lineView = PKCLineView(.height)
        self.addSubview(self.lineView)
        self.addConstraints(self.lineView.horizontalLayout())
        self.addConstraint(NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: self.lineView, attribute: .top, multiplier: 1, constant: 0))
    }
    
    
    public init(_ text: String, textColor: UIColor, handler: ((PKCAlertButtonType, String) -> Void)? = nil) {
        self.init()
        self.handler = handler
        
        let alertButton = PKCAlertButton(text, textColor: textColor)
        alertButton.addTarget(self, action: #selector(self.buttonDefaultAction(_:)), for: .touchUpInside)
        self.addSubview(alertButton)
        self.addConstraints(alertButton.verticalLayout())
        self.addConstraints(alertButton.horizontalLayout())
        
        self.addLineView()
    }
    
    
    public init(_ leftText: String, leftColor: UIColor, rightText: String, rightColor: UIColor, handler: ((PKCAlertButtonType, String) -> Void)? = nil) {
        self.init()
        self.handler = handler
        
        let leftAlertButton = PKCAlertButton(leftText, textColor: leftColor)
        leftAlertButton.addTarget(self, action: #selector(self.buttonLeftAction(_:)), for: .touchUpInside)
        self.addSubview(leftAlertButton)
        self.addConstraints(leftAlertButton.verticalLayout())
        
        let rightAlertButton = PKCAlertButton(rightText, textColor: rightColor)
        rightAlertButton.addTarget(self, action: #selector(self.buttonRightAction(_:)), for: .touchUpInside)
        self.addSubview(rightAlertButton)
        self.addConstraints(rightAlertButton.verticalLayout())
        
        let lineView = PKCLineView(.width)
        self.addSubview(lineView)
        self.addConstraints(lineView.verticalLayout())
        
        self.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-0-[view1]-0-[view2]-0-[view3]-0-|",
            options: NSLayoutFormatOptions(rawValue: 0), metrics: nil,
            views: ["view1": leftAlertButton, "view2": lineView, "view3": rightAlertButton]
        ))
        self.addConstraint(NSLayoutConstraint(item: leftAlertButton, attribute: .width, relatedBy: .equal, toItem: rightAlertButton, attribute: .width, multiplier: 1, constant: 0))
        
        
        self.addLineView()
    }
    
    public init(_ leftText: String, leftColor: UIColor, centerText: String, centerColor: UIColor, rightText: String, rightColor: UIColor, handler: ((PKCAlertButtonType, String) -> Void)? = nil) {
        self.init()
        self.handler = handler
        
        let leftAlertButton = PKCAlertButton(leftText, textColor: leftColor)
        leftAlertButton.addTarget(self, action: #selector(self.buttonLeftAction(_:)), for: .touchUpInside)
        self.addSubview(leftAlertButton)
        self.addConstraints(leftAlertButton.verticalLayout())
        
        let centerAlertButton = PKCAlertButton(centerText, textColor: centerColor)
        centerAlertButton.addTarget(self, action: #selector(self.buttonCenterAction(_:)), for: .touchUpInside)
        self.addSubview(centerAlertButton)
        self.addConstraints(centerAlertButton.verticalLayout())
        
        let rightAlertButton = PKCAlertButton(rightText, textColor: rightColor)
        rightAlertButton.addTarget(self, action: #selector(self.buttonRightAction(_:)), for: .touchUpInside)
        self.addSubview(rightAlertButton)
        self.addConstraints(rightAlertButton.verticalLayout())
        
        let lineView1 = PKCLineView(.width)
        self.addSubview(lineView1)
        self.addConstraints(lineView1.verticalLayout())
        
        let lineView2 = PKCLineView(.width)
        self.addSubview(lineView2)
        self.addConstraints(lineView2.verticalLayout())
        
        
        self.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-0-[view1]-0-[view2]-0-[view3]-0-[view4]-0-[view5]-0-|",
            options: NSLayoutFormatOptions(rawValue: 0), metrics: nil,
            views: ["view1": leftAlertButton, "view2": lineView1, "view3": centerAlertButton, "view4": lineView2, "view5": rightAlertButton]
        ))
        self.addConstraint(NSLayoutConstraint(item: leftAlertButton, attribute: .width, relatedBy: .equal, toItem: centerAlertButton, attribute: .width, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: leftAlertButton, attribute: .width, relatedBy: .equal, toItem: rightAlertButton, attribute: .width, multiplier: 1, constant: 0))
        
        
        
        self.addLineView()
    }
    
    
    
    
    
    
    
    
    @objc private func buttonLeftAction(_ sender: PKCAlertButton){
        self.handler?(.left, sender.title)
        self.delegate?.pkcButtonAction()
    }
    
    @objc private func buttonCenterAction(_ sender: PKCAlertButton){
        self.handler?(.center, sender.title)
        self.delegate?.pkcButtonAction()
    }
    
    @objc private func buttonRightAction(_ sender: PKCAlertButton){
        self.handler?(.right, sender.title)
        self.delegate?.pkcButtonAction()
    }
    
    @objc private func buttonDefaultAction(_ sender: PKCAlertButton){
        self.handler?(.default, sender.title)
        self.delegate?.pkcButtonAction()
    }
    
    
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
