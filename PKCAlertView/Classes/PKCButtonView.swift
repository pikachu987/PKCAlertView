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
    
    
    
    
    
    func addButtonGroupView(_ defaultButton: PKCAlertButton, handler: ((PKCAlertButtonType, String) -> Void)? = nil) -> PKCButtonGrouopView{
        let buttonGroupView = PKCButtonGrouopView(defaultButton, handler: handler)
        self.addButtonGroupView(buttonGroupView)
        return buttonGroupView
    }
    
    
    func addButtonGroupView(_ leftButton: PKCAlertButton, rightButton: PKCAlertButton, handler: ((PKCAlertButtonType, String) -> Void)? = nil) -> PKCButtonGrouopView{
        let buttonGroupView = PKCButtonGrouopView(leftButton, rightButton: rightButton, handler: handler)
        self.addButtonGroupView(buttonGroupView)
        return buttonGroupView
    }
    
    func addButtonGroupView(_ leftButton: PKCAlertButton, centerButton: PKCAlertButton, rightButton: PKCAlertButton, handler: ((PKCAlertButtonType, String) -> Void)? = nil) -> PKCButtonGrouopView{
        let buttonGroupView = PKCButtonGrouopView(leftButton, centerButton: centerButton, rightButton: rightButton, handler: handler)
        self.addButtonGroupView(buttonGroupView)
        return buttonGroupView
    }
    
    
    
    
    
    
    
    
    private func addButtonGroupView(_ buttonGroupView: PKCButtonGrouopView){
        self.addSubview(buttonGroupView)
        self.addConstraints(buttonGroupView.horizontalLayout())
        
        if let bottomConst = self.bottomConst, let lastButtonGroupView = self.lastButtonGroupView{
            let topConst = NSLayoutConstraint(item: lastButtonGroupView, attribute: .bottom, relatedBy: .equal, toItem: buttonGroupView, attribute: .top, multiplier: 1, constant: 0)
            self.addConstraint(topConst)
            bottomConst.isActive = false
        }else{
            let topConst = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: buttonGroupView, attribute: .top, multiplier: 1, constant: 0)
            self.addConstraint(topConst)
        }
        let bottomConst = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: buttonGroupView, attribute: .bottom, multiplier: 1, constant: 0)
        self.addConstraint(bottomConst)
        
        self.bottomConst = bottomConst
        self.lastButtonGroupView = buttonGroupView
    }
    
    
    
    
}
