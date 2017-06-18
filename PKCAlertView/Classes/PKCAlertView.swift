//
//  PKCAlertView.swift
//  Pods
//
//  Created by Kim Guanho on 2017. 6. 16..
//
//

import UIKit

public enum PKCAlertButtonType {
    case left, center, right, `default`
}

public enum PKCAlertAnimationType {
    case alpha, modal, `default`
}

public class PKCAlertView: UIView {
    public var containerView: PKCContainerView!
    public var animationTime: TimeInterval = 0.5
    public var animationType: PKCAlertAnimationType = .default
    
    fileprivate var superView: UIView!
    
    fileprivate var topConst: NSLayoutConstraint?
    fileprivate var bottomConst: NSLayoutConstraint?
    fileprivate var leadingConst: NSLayoutConstraint?
    fileprivate var trailingConst: NSLayoutConstraint?
    
    fileprivate var centerConst: NSLayoutConstraint!
    fileprivate var defaultTopConst: NSLayoutConstraint?
    
    public init(_ title: String, message: String) {
        super.init(frame: .zero)
        
        self.backgroundColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)
        self.alpha = 0
        self.isHidden = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        
        self.containerView = PKCContainerView(title, message: message)
        self.addSubview(self.containerView)
        
        
        self.addConstraints(self.containerView.horizontalLayout(left: 32, right: 32))
        
        self.centerConst = NSLayoutConstraint(
            item: self,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: self.containerView,
            attribute: .centerY,
            multiplier: 1,
            constant: 0)
        self.addConstraint(self.centerConst)
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func addSuperView(_ superView: UIView){
        self.superView = superView
        superView.addSubview(self)
        self.leadingConst = NSLayoutConstraint(item: superView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        self.trailingConst = NSLayoutConstraint(item: superView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
        self.topConst = NSLayoutConstraint(item: superView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        self.bottomConst = NSLayoutConstraint(item: superView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        self.leadingConst?.priority = UILayoutPriority(999)
        self.trailingConst?.priority = UILayoutPriority(999)
        self.topConst?.priority = UILayoutPriority(999)
        self.bottomConst?.priority = UILayoutPriority(999)
        superView.addConstraints([self.leadingConst!, self.trailingConst!, self.topConst!, self.bottomConst!])
    }
    
    
    
    
    
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
    
    
    
    public func addAlertButton(_ text: String, textColor: UIColor = .alertDefault, handler: ((PKCAlertButtonType, String) -> Void)? = nil){
        let groupButtonView = self.containerView.buttonView.addButtonGroupView(text, textColor: textColor, handler: handler)
        groupButtonView.delegate = self
    }
    
    public func show(){
        if self.superView == nil{
            return
        }
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
                
                self.centerConst.isActive = false
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
                    item: self.superView,
                    attribute: .bottom,
                    relatedBy: .equal,
                    toItem: self,
                    attribute: .top,
                    multiplier: 1,
                    constant: 0)
                self.superView.addConstraint(bottomConst)
                
                DispatchQueue.main.async{
                    bottomConst.isActive = false
                    UIView.animate(withDuration: self.animationTime) {
                        self.superView.layoutIfNeeded()
                    }
                }
            }else if self.animationType == .default{
                self.isHidden = false
                self.centerConst.isActive = false
                self.defaultTopConst = NSLayoutConstraint(
                    item: self,
                    attribute: .top,
                    relatedBy: .equal,
                    toItem: self.containerView,
                    attribute: .top,
                    multiplier: 1,
                    constant: self.containerView.bounds.height)
                self.addConstraint(self.defaultTopConst!)
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
    
}

extension PKCAlertView: PKCButtonDelegate{
    func pkcButtonAction() {
        if self.animationType == .alpha{
            UIView.animate(withDuration: self.animationTime, animations: {
                self.alpha = 0
            }, completion: { (_) in
                self.isHidden = true
            })
        }else if self.animationType == .modal{
            let bottomConst = NSLayoutConstraint(
                item: self.superView,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: self,
                attribute: .top,
                multiplier: 1,
                constant: 0)
            self.superView.addConstraints([bottomConst])
            UIView.animate(withDuration: self.animationTime, animations: {
                self.superView.layoutIfNeeded()
            }, completion: { (_) in
                self.alpha = 0
                self.isHidden = true
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
                })
            })
        }
    }
}
