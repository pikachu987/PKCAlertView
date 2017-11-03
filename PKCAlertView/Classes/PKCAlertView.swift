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

public enum PKCAlertButtonType {
    case left, center, right, `default`
}

public enum PKCAlertAnimationType {
    case alpha, modal, `default`
}

public class PKCAlertView: UIView {
    public var containerView: PKCContainerView
    public var animationTime: TimeInterval = 0.5
    public var animationType: PKCAlertAnimationType = .default
    
    var topConst: NSLayoutConstraint?
    var bottomConst: NSLayoutConstraint?
    var leadingConst: NSLayoutConstraint?
    var trailingConst: NSLayoutConstraint?
    
    fileprivate var centerConst: NSLayoutConstraint?
    fileprivate var defaultTopConst: NSLayoutConstraint?
    
    public init(_ title: String, message: String, bgColor: UIColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 0.8), padding: CGFloat = 32) {
        self.containerView = PKCContainerView(title, message: message)
        super.init(frame: .zero)
        self.backgroundColor = bgColor
        self.initVars(padding)
    }
    
    public init(_ title: String, message: String, bgColor: UIColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 0.8), width: CGFloat) {
        self.containerView = PKCContainerView(title, message: message)
        super.init(frame: .zero)
        self.backgroundColor = bgColor
        let padding = (UIScreen.main.bounds.width - width)/2
        self.initVars(padding)
    }
    
    private override init(frame: CGRect) {
        self.containerView = PKCContainerView("", message: "")
        super.init(frame: frame)
        self.initVars(32)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deinit")
    }
    
    
    
    private func initVars(_ padding: CGFloat){
        self.alpha = 0
        self.isHidden = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.addSubview(self.containerView)
        self.addConstraints(self.containerView.horizontalLayout(left: padding, right: padding))
        
        let centerConst = NSLayoutConstraint(
            item: self,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: self.containerView,
            attribute: .centerY,
            multiplier: 1,
            constant: 0)
        self.addConstraint(centerConst)
        self.centerConst = centerConst
    }
    
    
    
    
    
    // MARK: AddView
    
    public func addAlertView(_ text: String, textColor: UIColor = .alertDefault, handler: ((PKCAlertButtonType, String) -> Void)? = nil){
        let groupButtonView = self.containerView.buttonView.addButtonGroupView(text, textColor: textColor, handler: handler)
        groupButtonView.delegate = self
    }
    
    public func addAlertView(_ leftText: String, leftColor: UIColor = .alertCancel, rightText: String, rightColor: UIColor = .alertDefault, handler: ((PKCAlertButtonType, String) -> Void)? = nil){
        let groupButtonView = self.containerView.buttonView.addButtonGroupView(leftText, leftColor: leftColor, rightText: rightText, rightColor: rightColor, handler: handler)
        groupButtonView.delegate = self
    }
    
    public func addAlertView(_ leftText: String, leftColor: UIColor = .alertCancel, centerText: String, centerColor: UIColor = .alertDefault, rightText: String, rightColor: UIColor = .alertDefault, handler: ((PKCAlertButtonType, String) -> Void)? = nil){
        let groupButtonView = self.containerView.buttonView.addButtonGroupView(leftText, leftColor: leftColor, centerText: centerText, centerColor: centerColor, rightText: rightText, rightColor: rightColor, handler: handler)
        groupButtonView.delegate = self
    }
    
    
    // MARK: AddButton
    
    public func addAlertButton(_ defaultButton: PKCAlertButton, handler: ((PKCAlertButtonType, String) -> Void)? = nil){
        let groupButtonView = self.containerView.buttonView.addButtonGroupView(defaultButton, handler: handler)
        groupButtonView.delegate = self
    }
    
    
    public func addAlertButton(_ leftButton: PKCAlertButton, rightButton: PKCAlertButton, handler: ((PKCAlertButtonType, String) -> Void)? = nil){
        let groupButtonView = self.containerView.buttonView.addButtonGroupView(leftButton, rightButton: rightButton, handler: handler)
        groupButtonView.delegate = self
    }
    
    public func addAlertButton(_ leftButton: PKCAlertButton, centerButton: PKCAlertButton, rightButton: PKCAlertButton, handler: ((PKCAlertButtonType, String) -> Void)? = nil){
        let groupButtonView = self.containerView.buttonView.addButtonGroupView(leftButton, centerButton: centerButton, rightButton: rightButton, handler: handler)
        groupButtonView.delegate = self
    }
    
    
    
    
    
    
    
    
    private func topWindow() -> UIWindow?{
        for window in UIApplication.shared.windows.reversed(){
            if window.windowLevel == UIWindowLevelNormal && window.isKeyWindow && window.frame != CGRect.zero{
                return window
            }
        }
        return nil
    }
    
    
    
    
    // MARK: Animation
    
    public func show(){
        guard let window = self.topWindow() else {
            return
        }
        window.addSubview(self)
        let leadingConst = NSLayoutConstraint(item: window, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        let trailingConst = NSLayoutConstraint(item: window, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
        let topConst = NSLayoutConstraint(item: window, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let bottomConst = NSLayoutConstraint(item: window, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        leadingConst.priority = UILayoutPriority(999)
        trailingConst.priority = UILayoutPriority(999)
        topConst.priority = UILayoutPriority(999)
        bottomConst.priority = UILayoutPriority(999)
        window.addConstraints([leadingConst, trailingConst, topConst, bottomConst])
        self.leadingConst = leadingConst
        self.trailingConst = trailingConst
        self.topConst = topConst
        self.bottomConst = bottomConst
        
        self.containerView.sizeToFit()
        
        
        DispatchQueue.main.async{
            self.alpha = 0
            self.isHidden = true
            if self.animationType == .alpha{
                self.isHidden = false
                UIView.animate(withDuration: self.animationTime) {
                    self.alpha = 1
                }
            }else if self.animationType == .modal{
                self.alpha = 1
                self.isHidden = false
                
                self.centerConst?.isActive = false
                let topConst = NSLayoutConstraint(
                    item: self,
                    attribute: .top,
                    relatedBy: .equal,
                    toItem: self.containerView,
                    attribute: .top,
                    multiplier: 1,
                    constant: -(self.bounds.height - self.containerView.bounds.height)/2)
                self.addConstraint(topConst)
                
                let bottomConst = NSLayoutConstraint(
                    item: window,
                    attribute: .bottom,
                    relatedBy: .equal,
                    toItem: self,
                    attribute: .top,
                    multiplier: 1,
                    constant: 0)
                self.superview?.addConstraint(bottomConst)
                
                DispatchQueue.main.async{
                    bottomConst.isActive = false
                    UIView.animate(withDuration: self.animationTime) {
                        self.superview?.layoutIfNeeded()
                    }
                }
            }else if self.animationType == .default{
                self.isHidden = false
                self.centerConst?.isActive = false
                let defaultTopConst = NSLayoutConstraint(
                    item: self,
                    attribute: .top,
                    relatedBy: .equal,
                    toItem: self.containerView,
                    attribute: .top,
                    multiplier: 1,
                    constant: self.containerView.bounds.height)
                self.addConstraint(defaultTopConst)
                self.defaultTopConst = defaultTopConst
                UIView.animate(withDuration: self.animationTime/3, animations: { 
                    self.alpha = 1
                }, completion: { (_) in
                    self.defaultTopConst?.constant = -(self.bounds.height - self.containerView.bounds.height)/2
                    UIView.animate(withDuration: self.animationTime/3*2, animations: {
                        self.layoutIfNeeded()
                    })
                })
            }
        }
    }
    
    
    public func hide(){
        guard let superview = self.superview else{
            return
        }
        if self.animationType == .alpha{
            UIView.animate(withDuration: self.animationTime, animations: {
                self.alpha = 0
            }, completion: { (_) in
                self.isHidden = true
                self.removeFromSuperview()
            })
        }else if self.animationType == .modal{
            let bottomConst = NSLayoutConstraint(
                item: superview,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: self,
                attribute: .top,
                multiplier: 1,
                constant: 0)
            self.superview?.addConstraints([bottomConst])
            UIView.animate(withDuration: self.animationTime, animations: {
                self.superview?.layoutIfNeeded()
            }, completion: { (_) in
                self.alpha = 0
                self.isHidden = true
                self.removeFromSuperview()
            })
        }else if self.animationType == .default{
            self.defaultTopConst?.constant = self.containerView.bounds.height
            UIView.animate(withDuration: self.animationTime/3*2, animations: {
                self.layoutIfNeeded()
            }, completion: { (_) in
                UIView.animate(withDuration: self.animationTime/3, animations: {
                    self.alpha = 0
                }, completion: { (_) in
                    self.isHidden = true
                    self.removeFromSuperview()
                })
            })
        }
    }
    
    
}




extension PKCAlertView: PKCButtonDelegate{
    func pkcButtonAction() {
        self.hide()
    }
}
