//
//  PKCAlertButton.swift
//  Pods
//
//  Created by Kim Guanho on 2017. 6. 17..
//
//

import UIKit

public class PKCAlertButton: UIButton {
    var title = ""
    var textColor = UIColor.alertDefault
    
    public init(_ title: String, textColor: UIColor = UIColor.alertDefault) {
        super.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.clear
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10)
        self.title = title
        self.textColor = textColor
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(textColor, for: .normal)
        
        self.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .height,
            multiplier: 1,
            constant: 44))
        
        self.addTarget(self, action: #selector(self.touchUpInside(_:)), for: .touchUpInside)
        self.addTarget(self, action: #selector(self.touchDown(_:)), for: .touchDown)
        self.addTarget(self, action: #selector(self.touchUpInside(_:)), for: .touchDragExit)
    }
    
    @objc func touchDown(_ sender: PKCAlertButton){
        self.backgroundColor = UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 1)
    }
    
    @objc func touchUpInside(_ sender: PKCAlertButton){
        self.backgroundColor = UIColor.clear
    }
    
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
