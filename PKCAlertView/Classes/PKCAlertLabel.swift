//
//  PKCAlertLabel.swift
//  Pods
//
//  Created by Kim Guanho on 2017. 6. 17..
//
//

import UIKit

enum PKCAlertLabelType {
    case title, message
}

class PKCAlertLabel: UILabel {
    
    var inset: UIEdgeInsets = UIEdgeInsetsMake(7, 7, 7, 7)
    
    public init(_ text: String, inset: UIEdgeInsets, type: PKCAlertLabelType) {
        super.init(frame: CGRect.zero)
        self.text = text
        self.textAlignment = .center
        self.numberOfLines = 0
        self.inset = inset
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if type == .title{
            self.font = UIFont(name: ".SFUIText-Semibold", size: 17)
        }else if type == .message{
            self.font = UIFont.systemFont(ofSize: 14)
        }
    }
    
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, self.inset))
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += self.inset.top + self.inset.bottom
            contentSize.width += self.inset.left + self.inset.right
            return contentSize
        }
    }
}
