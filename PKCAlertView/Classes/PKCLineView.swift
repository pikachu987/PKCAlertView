//
//  PKCLineView.swift
//  Pods
//
//  Created by Kim Guanho on 2017. 6. 17..
//
//

import UIKit

class PKCLineView: UIView {
    public init(_ type: NSLayoutAttribute) {
        super.init(frame: .zero)
        self.backgroundColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(
            item: self,
            attribute: type,
            relatedBy: .equal,
            toItem: nil,
            attribute: type,
            multiplier: 1,
            constant: 1))
    }
    
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
