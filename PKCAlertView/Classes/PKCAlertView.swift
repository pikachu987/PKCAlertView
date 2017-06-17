//
//  PKCAlertView.swift
//  Pods
//
//  Created by Kim Guanho on 2017. 6. 16..
//
//

import UIKit

extension UIColor{
    static let alertDefault = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1)
}

public class PKCAlertView: UIView {
    
    public init(_ title: String, description: String, text: String, textColor: UIColor = .alertDefault) {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.red
    }
    
    public init(_ title: String, description: String, leftText: String, leftColor: UIColor = .red, rightText: String, rightColor: UIColor = .alertDefault) {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.red
    }
    
    public init(_ title: String, description: String, leftText: String, leftColor: UIColor = .alertDefault, centerText: String, centerColor: UIColor = .alertDefault,  rightText: String, rightColor: UIColor = .alertDefault) {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.red
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.red//UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
    }
    
    public func addSuperView(_ superView: UIView){
        self.translatesAutoresizingMaskIntoConstraints = false
        superView.addSubview(self)
        let view_constraint_H = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": self])
        let view_constraint_V = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: NSLayoutFormatOptions.alignAllLeading, metrics: nil, views: ["view": self])
        superView.addConstraints(view_constraint_H)
        superView.addConstraints(view_constraint_V)
    }
}
