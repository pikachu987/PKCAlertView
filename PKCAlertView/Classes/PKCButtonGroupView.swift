//Copyright (c) 2017 pikachu987 <pikachu77769@gmail.com>
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.

import UIKit

protocol PKCButtonDelegate: class {
    func pkcButtonAction()
}

class PKCButtonGrouopView: UIView {
    var lineView: PKCLineView?
    var delegate: PKCButtonDelegate?
    var handler: ((PKCAlertButtonType, String) -> Void)? = nil
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
    }
    
    
    
    private func addLineView(){
        let lineView = PKCLineView(.height)
        self.addSubview(lineView)
        self.addConstraints(lineView.horizontalLayout())
        self.addConstraint(NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: lineView, attribute: .top, multiplier: 1, constant: 0))
        self.lineView = lineView
    }
    
    
    
    
    public init(_ defaultButton: PKCAlertButton, handler: ((PKCAlertButtonType, String) -> Void)? = nil) {
        self.init()
        self.handler = handler
        
        defaultButton.addTarget(self, action: #selector(self.buttonDefaultAction(_:)), for: .touchUpInside)
        self.addSubview(defaultButton)
        self.addConstraints(defaultButton.verticalLayout())
        self.addConstraints(defaultButton.horizontalLayout())
        
        self.addLineView()
    }
    
    
    
    
    
    public init(_ leftButton: PKCAlertButton, rightButton: PKCAlertButton, handler: ((PKCAlertButtonType, String) -> Void)? = nil) {
        self.init()
        self.handler = handler
        
        leftButton.addTarget(self, action: #selector(self.buttonLeftAction(_:)), for: .touchUpInside)
        self.addSubview(leftButton)
        self.addConstraints(leftButton.verticalLayout())
        
        rightButton.addTarget(self, action: #selector(self.buttonRightAction(_:)), for: .touchUpInside)
        self.addSubview(rightButton)
        self.addConstraints(rightButton.verticalLayout())
        
        let lineView = PKCLineView(.width)
        self.addSubview(lineView)
        self.addConstraints(lineView.verticalLayout())
        
        self.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-0-[view1]-0-[view2]-0-[view3]-0-|",
            options: NSLayoutFormatOptions(rawValue: 0), metrics: nil,
            views: ["view1": leftButton, "view2": lineView, "view3": rightButton]
        ))
        self.addConstraint(NSLayoutConstraint(item: leftButton, attribute: .width, relatedBy: .equal, toItem: rightButton, attribute: .width, multiplier: 1, constant: 0))
        
        
        self.addLineView()
    }
    
    
    
    
    
    public init(_ leftButton: PKCAlertButton, centerButton: PKCAlertButton, rightButton: PKCAlertButton, handler: ((PKCAlertButtonType, String) -> Void)? = nil) {
        self.init()
        self.handler = handler
        
        leftButton.addTarget(self, action: #selector(self.buttonLeftAction(_:)), for: .touchUpInside)
        self.addSubview(leftButton)
        self.addConstraints(leftButton.verticalLayout())
        
        centerButton.addTarget(self, action: #selector(self.buttonCenterAction(_:)), for: .touchUpInside)
        self.addSubview(centerButton)
        self.addConstraints(centerButton.verticalLayout())
        
        rightButton.addTarget(self, action: #selector(self.buttonRightAction(_:)), for: .touchUpInside)
        self.addSubview(rightButton)
        self.addConstraints(rightButton.verticalLayout())
        
        let lineView1 = PKCLineView(.width)
        self.addSubview(lineView1)
        self.addConstraints(lineView1.verticalLayout())
        
        let lineView2 = PKCLineView(.width)
        self.addSubview(lineView2)
        self.addConstraints(lineView2.verticalLayout())
        
        
        self.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-0-[view1]-0-[view2]-0-[view3]-0-[view4]-0-[view5]-0-|",
            options: NSLayoutFormatOptions(rawValue: 0), metrics: nil,
            views: ["view1": leftButton, "view2": lineView1, "view3": centerButton, "view4": lineView2, "view5": rightButton]
        ))
        self.addConstraint(NSLayoutConstraint(item: leftButton, attribute: .width, relatedBy: .equal, toItem: centerButton, attribute: .width, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: leftButton, attribute: .width, relatedBy: .equal, toItem: rightButton, attribute: .width, multiplier: 1, constant: 0))
        
        
        
        self.addLineView()
    }
    
    
    
    
    public convenience init(_ text: String, textColor: UIColor, handler: ((PKCAlertButtonType, String) -> Void)? = nil) {
        let defaultButton = PKCAlertButton(text, textColor: textColor)
        self.init(defaultButton, handler: handler)
    }
    
    
    public convenience init(_ leftText: String, leftColor: UIColor, rightText: String, rightColor: UIColor, handler: ((PKCAlertButtonType, String) -> Void)? = nil) {
        let leftButton = PKCAlertButton(leftText, textColor: leftColor)
        let rightButton = PKCAlertButton(rightText, textColor: rightColor)
        self.init(leftButton, rightButton: rightButton, handler: handler)
    }
    
    
    
    public convenience init(_ leftText: String, leftColor: UIColor, centerText: String, centerColor: UIColor, rightText: String, rightColor: UIColor, handler: ((PKCAlertButtonType, String) -> Void)? = nil) {
        let leftButton = PKCAlertButton(leftText, textColor: leftColor)
        let centerButton = PKCAlertButton(centerText, textColor: centerColor)
        let rightButton = PKCAlertButton(rightText, textColor: rightColor)
        self.init(leftButton, centerButton: centerButton, rightButton: rightButton, handler: handler)
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
